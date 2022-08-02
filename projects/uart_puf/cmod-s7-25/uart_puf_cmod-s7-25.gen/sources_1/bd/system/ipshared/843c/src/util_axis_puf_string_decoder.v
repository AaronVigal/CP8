// ***************************************************************************
// ***************************************************************************
// @FILE    util_axis_puf_string_decoder.v
// @AUTHOR  Jay Convertino
// @DATE    2022.04.25
// @BRIEF   Convert strings to puf data.
// @DETAILS Carrige return terminated string converted to puf data.
//
// @LICENSE MIT
//  Copyright 2021 Jay Convertino
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
module util_axis_puf_string_decoder
  (
    //axi streaming clock and reset.
    input        aclk,
    input        arstn,
    //axis slave interface (input)
    input   [ 87:0] s_axis_tdata,
    input           s_axis_tvalid,
    output          s_axis_tready,
    //axis master interface (out)
    output  reg [ 7:0]  m_axis_tdata,
    output  reg         m_axis_tvalid,
    output  reg [ 3:0]  m_axis_tuser,
    input               m_axis_tready
  );
  
  reg p_m_axis_tready;
  reg force_s_axis_tready;
  
  //core does its conversion in a single clock cycle, tready needs to be sent to
  //the block before it since no blocking is done here.
  assign s_axis_tready = m_axis_tready | force_s_axis_tready;
  
  always @(posedge aclk) begin
    if(arstn == 1'b0) begin
      m_axis_tdata    <= 0;
      m_axis_tvalid   <= 0;
      m_axis_tuser    <= 0;
      p_m_axis_tready <= 0;
      force_s_axis_tready <= 0;
    end else begin
        
        force_s_axis_tready <= 0;
        
        //when ready, 0 out data so we don't send out the same thing over and over.
        if(m_axis_tready == 1'b1) begin
          m_axis_tdata    <= 0;
          m_axis_tvalid   <= 0;
          m_axis_tuser    <= 0;
          //no valid data, so lets 0 out previous to allow a valid assert of data without ready.
          p_m_axis_tready <= 0;
        end
        
        //decode data into bits, wait for the ready signel to be correct.
        if((s_axis_tvalid == 1'b1) && (~p_m_axis_tready || m_axis_tready)) begin
        
          //only update tready previous when tready is 1 or 0 0 (inital or no valid data for a while).
          p_m_axis_tready <= m_axis_tready;
          
          //data will be valid if string is terminated at the correct position.
          m_axis_tvalid <= 1'b1;
          //check return
          //CR(D)
          if(s_axis_tdata[7:0] != 8'h0D) begin
            m_axis_tvalid       <= 1'b0;
            force_s_axis_tready <= 1'b1;
          end
          
          //decode sel regester target
          case(s_axis_tdata[87:56])
            "SELA": begin
              m_axis_tuser <= 4'b0001;
            end
            "SELB": begin
              m_axis_tuser <= 4'b0010;
            end
            default: begin
              m_axis_tuser <= 4'b0000;
            end
          endcase
          
          //check if its the start signal, if it is set tuser
          if(s_axis_tdata[87:48] == "START") begin
            m_axis_tuser <= 4'b0100;
          end

          //NOW, the OW will be decoded... which is non-sense. Start condition core is expected to ignore this.
          //offset conversion for hex to decimal
          // 48 is for 0 to 9, 55 is for 10 to 15 (A to F)
          m_axis_tdata[ 7: 4] <= ((s_axis_tdata[31:24] - 48) < 10 ? (s_axis_tdata[31:24] - 48) : (s_axis_tdata[31:24] - 55));
          m_axis_tdata[ 3: 0] <= ((s_axis_tdata[23:16] - 48) < 10 ? (s_axis_tdata[23:16] - 48) : (s_axis_tdata[23:16] - 55));

        end
    end
  end
  
endmodule
