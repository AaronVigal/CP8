// ***************************************************************************
// ***************************************************************************
// @FILE    util_axis_puf_controller.v
// @AUTHOR  Jay Convertino
// @DATE    2022.04.25
// @BRIEF   Interface string encoder/decoder with puf core. Fixed sizes for
//          lazyness.
//
// @LICENSE MIT
//  Copyright 2022 Jay Convertino
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to 
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or 
//  sell copies of the Software, and to permit persons to whom the Software is 
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in 
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//  IN THE SOFTWARE.
// ***************************************************************************
// ***************************************************************************

`timescale 1ns/100ps

//string to puf
module util_axis_puf_controller
  (
    //axi streaming clock and reset.
    input               aclk,
    input               arstn,
    //axis slave interface (input)
    input       [ 7:0]  s_axis_tdata,
    input               s_axis_tvalid,
    input       [ 3:0]  s_axis_tuser,
    output              s_axis_tready,
    //axis master interface (out)
    output  reg [ 7:0]  m_axis_tdata,
    output  reg         m_axis_tvalid,
    input               m_axis_tready,
    //puf interface (in/out)
    input       [ 7:0]  puf_data,
    input               puf_valid,
    output  reg [ 7:0]  puf_sela,
    output  reg [ 7:0]  puf_selb,
    output              puf_w
  );
  
  reg r_puf_w;
  reg r_m_axis_tready;
  
  //core is ready when w has not been set to 1
  assign s_axis_tready = ~r_puf_w;
  //wire puf_w register to puf_w output
  assign puf_w = r_puf_w;
  
  always @(posedge aclk) begin
    // resets
    if(arstn == 1'b0) begin
      m_axis_tdata    <= 0;
      m_axis_tvalid   <= 0;
      puf_sela        <= 0;
      puf_selb        <= 0;
      r_puf_w         <= 0;
      r_m_axis_tready <= 0;
    end else begin
      m_axis_tdata    <= m_axis_tdata;
      m_axis_tvalid   <= m_axis_tvalid;
    
      // when there is no valid and such, these lines should be asserted to 0
      if(m_axis_tready == 1'b1) begin
        m_axis_tdata    <= 0;
        m_axis_tvalid   <= 0;
        r_m_axis_tready <= m_axis_tready;
      end
      
      // didn't use a state machine. would be easier to understand, but this 
      // is so simple it really doesn't need it.
      // if it has valid input data, w is deasserted, and we output data successfully
      // process slave input.
      if((s_axis_tvalid == 1'b1) && (r_puf_w != 1'b1) && (r_m_axis_tready == 1'b1)) begin
        case(s_axis_tuser)
          4'h1 : begin
            puf_sela <= s_axis_tdata;
          end
          4'h2 : begin
            puf_selb <= s_axis_tdata;
          end
          4'h4 : begin
            r_puf_w <= 1'b1;
          end
          default : begin
            puf_sela <= 0;
            puf_selb <= 0;
            r_puf_w <= 1'b0;
          end
        endcase
      end
      
      // if we are in the write state and the puf outputs valid data,
      // output the data and let puf go back to start (deassert w).
      if((r_puf_w == 1'b1) && (puf_valid == 1'b1)) begin
        m_axis_tdata    <= puf_data;
        m_axis_tvalid   <= puf_valid;
        r_puf_w         <= 1'b0;
        r_m_axis_tready <= m_axis_tready;
      end
    end
  end
  
endmodule
