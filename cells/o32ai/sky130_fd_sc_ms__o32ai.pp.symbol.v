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

`ifndef SKY130_FD_SC_MS__O32AI_PP_SYMBOL_V
`define SKY130_FD_SC_MS__O32AI_PP_SYMBOL_V

/**
 * o32ai: 3-input OR and 2-input OR into 2-input NAND.
 *
 *        Y = !((A1 | A2 | A3) & (B1 | B2))
 *
 * Verilog stub (with power pins) for graphical symbol definition
 * generation.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

(* blackbox *)
module sky130_fd_sc_ms__o32ai (
    //# {{data|Data Signals}}
    input  A1  ,
    input  A2  ,
    input  A3  ,
    input  B1  ,
    input  B2  ,
    output Y   ,

    //# {{power|Power}}
    input  VPB ,
    input  VPWR,
    input  VGND,
    input  VNB
);
endmodule

`default_nettype wire
`endif  // SKY130_FD_SC_MS__O32AI_PP_SYMBOL_V
