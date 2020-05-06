/**
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

`ifndef SKY130_FD_SC_MS__UDP_MUX_4TO2_TB_V
`define SKY130_FD_SC_MS__UDP_MUX_4TO2_TB_V

/**
 * udp_mux_4to2: Four to one multiplexer with 2 select controls
 *
 * Autogenerated test bench.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`include "sky130_fd_sc_ms__udp_mux_4to2.v"

module top();

    // Inputs are registered
    reg A0;
    reg A1;
    reg A2;
    reg A3;
    reg S0;
    reg S1;

    // Outputs are wires
    wire X;

    initial
    begin
        // Initial state is x for all inputs.
        A0 = 1'bX;
        A1 = 1'bX;
        A2 = 1'bX;
        A3 = 1'bX;
        S0 = 1'bX;
        S1 = 1'bX;

        #20   A0 = 1'b0;
        #40   A1 = 1'b0;
        #60   A2 = 1'b0;
        #80   A3 = 1'b0;
        #100  S0 = 1'b0;
        #120  S1 = 1'b0;
        #140  A0 = 1'b1;
        #160  A1 = 1'b1;
        #180  A2 = 1'b1;
        #200  A3 = 1'b1;
        #220  S0 = 1'b1;
        #240  S1 = 1'b1;
        #260  A0 = 1'b0;
        #280  A1 = 1'b0;
        #300  A2 = 1'b0;
        #320  A3 = 1'b0;
        #340  S0 = 1'b0;
        #360  S1 = 1'b0;
        #380  S1 = 1'b1;
        #400  S0 = 1'b1;
        #420  A3 = 1'b1;
        #440  A2 = 1'b1;
        #460  A1 = 1'b1;
        #480  A0 = 1'b1;
        #500  S1 = 1'bx;
        #520  S0 = 1'bx;
        #540  A3 = 1'bx;
        #560  A2 = 1'bx;
        #580  A1 = 1'bx;
        #600  A0 = 1'bx;
    end

    sky130_fd_sc_ms__udp_mux_4to2 dut (.A0(A0), .A1(A1), .A2(A2), .A3(A3), .S0(S0), .S1(S1), .X(X));

endmodule

`default_nettype wire
`endif  // SKY130_FD_SC_MS__UDP_MUX_4TO2_TB_V
