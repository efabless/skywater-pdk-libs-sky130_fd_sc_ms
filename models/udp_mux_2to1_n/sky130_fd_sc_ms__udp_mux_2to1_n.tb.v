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

`ifndef SKY130_FD_SC_MS__UDP_MUX_2TO1_N_TB_V
`define SKY130_FD_SC_MS__UDP_MUX_2TO1_N_TB_V

/**
 * udp_mux_2to1_N: Two to one multiplexer with inverting output
 *
 * Autogenerated test bench.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`include "sky130_fd_sc_ms__udp_mux_2to1_n.v"

module top();

    // Inputs are registered
    reg A0;
    reg A1;
    reg S;

    // Outputs are wires
    wire Y;

    initial
    begin
        // Initial state is x for all inputs.
        A0 = 1'bX;
        A1 = 1'bX;
        S  = 1'bX;

        #20   A0 = 1'b0;
        #40   A1 = 1'b0;
        #60   S  = 1'b0;
        #80   A0 = 1'b1;
        #100  A1 = 1'b1;
        #120  S  = 1'b1;
        #140  A0 = 1'b0;
        #160  A1 = 1'b0;
        #180  S  = 1'b0;
        #200  S  = 1'b1;
        #220  A1 = 1'b1;
        #240  A0 = 1'b1;
        #260  S  = 1'bx;
        #280  A1 = 1'bx;
        #300  A0 = 1'bx;
    end

    sky130_fd_sc_ms__udp_mux_2to1_N dut (.A0(A0), .A1(A1), .S(S), .Y(Y));

endmodule

`default_nettype wire
`endif  // SKY130_FD_SC_MS__UDP_MUX_2TO1_N_TB_V
