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

`ifndef SKY130_FD_SC_MS__DLXBN_TB_V
`define SKY130_FD_SC_MS__DLXBN_TB_V

/**
 * dlxbn: Delay latch, inverted enable, complementary outputs.
 *
 * Autogenerated test bench.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`include "sky130_fd_sc_ms__dlxbn.v"

module top();

    // Inputs are registered
    reg D;
    reg VPWR;
    reg VGND;
    reg VPB;
    reg VNB;

    // Outputs are wires
    wire Q;
    wire Q_N;

    initial
    begin
        // Initial state is x for all inputs.
        D    = 1'bX;
        VGND = 1'bX;
        VNB  = 1'bX;
        VPB  = 1'bX;
        VPWR = 1'bX;

        #20   D    = 1'b0;
        #40   VGND = 1'b0;
        #60   VNB  = 1'b0;
        #80   VPB  = 1'b0;
        #100  VPWR = 1'b0;
        #120  D    = 1'b1;
        #140  VGND = 1'b1;
        #160  VNB  = 1'b1;
        #180  VPB  = 1'b1;
        #200  VPWR = 1'b1;
        #220  D    = 1'b0;
        #240  VGND = 1'b0;
        #260  VNB  = 1'b0;
        #280  VPB  = 1'b0;
        #300  VPWR = 1'b0;
        #320  VPWR = 1'b1;
        #340  VPB  = 1'b1;
        #360  VNB  = 1'b1;
        #380  VGND = 1'b1;
        #400  D    = 1'b1;
        #420  VPWR = 1'bx;
        #440  VPB  = 1'bx;
        #460  VNB  = 1'bx;
        #480  VGND = 1'bx;
        #500  D    = 1'bx;
    end

    // Create a clock
    reg GATE_N;
    initial
    begin
        GATE_N = 1'b0;
    end

    always
    begin
        #5 GATE_N = ~GATE_N;
    end

    sky130_fd_sc_ms__dlxbn dut (.D(D), .VPWR(VPWR), .VGND(VGND), .VPB(VPB), .VNB(VNB), .Q(Q), .Q_N(Q_N), .GATE_N(GATE_N));

endmodule

`default_nettype wire
`endif  // SKY130_FD_SC_MS__DLXBN_TB_V
