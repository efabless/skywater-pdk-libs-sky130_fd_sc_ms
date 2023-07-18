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

`ifndef SKY130_FD_SC_MS__FILL_DIODE_4_PP_BLACKBOX_V
`define SKY130_FD_SC_MS__FILL_DIODE_4_PP_BLACKBOX_V

/**
 * fill_diode: Fill diode.
 *
 * Verilog stub definition (black box with power pins).
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

(* blackbox *)
module sky130_fd_sc_ms__fill_diode_4 (
    VPWR,
    VGND,
    VPB ,
    VNB
);

    input VPWR;
    input VGND;
    input VPB ;
    input VNB ;
endmodule

`default_nettype wire
`endif  // SKY130_FD_SC_MS__FILL_DIODE_4_PP_BLACKBOX_V
