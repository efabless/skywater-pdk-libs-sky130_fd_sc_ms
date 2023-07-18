/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_MS__O221AI_2_TIMING_V
`define SKY130_FD_SC_MS__O221AI_2_TIMING_V

/**
 * o221ai: 2-input OR into first two inputs of 3-input NAND.
 *
 *         Y = !((A1 | A2) & (B1 | B2) & C1)
 *
 * Verilog simulation timing model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_ms__o221ai_2 (
    Y ,
    A1,
    A2,
    B1,
    B2,
    C1
);

    // Module ports
    output Y ;
    input  A1;
    input  A2;
    input  B1;
    input  B2;
    input  C1;

    // Module supplies
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    // Local signals
    wire or0_out    ;
    wire or1_out    ;
    wire nand0_out_Y;

    //   Name   Output       Other arguments
    or   or0   (or0_out    , B2, B1              );
    or   or1   (or1_out    , A2, A1              );
    nand nand0 (nand0_out_Y, or1_out, or0_out, C1);
    buf  buf0  (Y          , nand0_out_Y         );

specify
if ((!A2&!B1&B2&C1)) (A1 -=> Y) = (0:0:0,0:0:0);
if ((!A2&B1&!B2&C1)) (A1 -=> Y) = (0:0:0,0:0:0);
if ((!A2&B1&B2&C1)) (A1 -=> Y) = (0:0:0,0:0:0);
if ((!A1&!B1&B2&C1)) (A2 -=> Y) = (0:0:0,0:0:0);
if ((!A1&B1&!B2&C1)) (A2 -=> Y) = (0:0:0,0:0:0);
if ((!A1&B1&B2&C1)) (A2 -=> Y) = (0:0:0,0:0:0);
if ((!A1&A2&!B2&C1)) (B1 -=> Y) = (0:0:0,0:0:0);
if ((A1&!A2&!B2&C1)) (B1 -=> Y) = (0:0:0,0:0:0);
if ((A1&A2&!B2&C1)) (B1 -=> Y) = (0:0:0,0:0:0);
if ((!A1&A2&!B1&C1)) (B2 -=> Y) = (0:0:0,0:0:0);
if ((A1&!A2&!B1&C1)) (B2 -=> Y) = (0:0:0,0:0:0);
if ((A1&A2&!B1&C1)) (B2 -=> Y) = (0:0:0,0:0:0);
if ((!A1&A2&!B1&B2)) (C1 -=> Y) = (0:0:0,0:0:0);
if ((!A1&A2&B1&!B2)) (C1 -=> Y) = (0:0:0,0:0:0);
if ((!A1&A2&B1&B2)) (C1 -=> Y) = (0:0:0,0:0:0);
if ((A1&!A2&!B1&B2)) (C1 -=> Y) = (0:0:0,0:0:0);
if ((A1&!A2&B1&!B2)) (C1 -=> Y) = (0:0:0,0:0:0);
if ((A1&!A2&B1&B2)) (C1 -=> Y) = (0:0:0,0:0:0);
if ((A1&A2&!B1&B2)) (C1 -=> Y) = (0:0:0,0:0:0);
if ((A1&A2&B1&!B2)) (C1 -=> Y) = (0:0:0,0:0:0);
if ((A1&A2&B1&B2)) (C1 -=> Y) = (0:0:0,0:0:0);
endspecify
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_MS__O221AI_2_TIMING_V
