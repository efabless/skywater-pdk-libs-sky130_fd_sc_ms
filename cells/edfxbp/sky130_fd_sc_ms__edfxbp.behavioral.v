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


`ifndef SKY130_FD_SC_MS__EDFXBP_BEHAVIORAL_V
`define SKY130_FD_SC_MS__EDFXBP_BEHAVIORAL_V

/**
 * edfxbp: Delay flop with loopback enable, non-inverted clock,
 *         complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_ms__udp_mux_2to1.v"
`include "../../models/udp_dff_p_pp_pg_n/sky130_fd_sc_ms__udp_dff_p_pp_pg_n.v"

`celldefine
module sky130_fd_sc_ms__edfxbp (
    Q  ,
    Q_N,
    CLK,
    D  ,
    DE
);

    // Module ports
    output Q  ;
    output Q_N;
    input  CLK;
    input  D  ;
    input  DE ;

    // Module supplies
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    // Local signals
    wire buf_Q      ;
    reg  notifier   ;
    wire D_delayed  ;
    wire DE_delayed ;
    wire CLK_delayed;
    wire mux_out    ;
    wire awake      ;
    wire cond0      ;

    //                                 Name       Output   Other arguments
    sky130_fd_sc_ms__udp_mux_2to1      mux_2to10 (mux_out, buf_Q, D_delayed, DE_delayed              );
    sky130_fd_sc_ms__udp_dff$P_pp$PG$N dff0      (buf_Q  , mux_out, CLK_delayed, notifier, VPWR, VGND);
    assign awake = ( VPWR === 1'b1 );
    assign cond0 = ( awake && ( DE_delayed === 1'b1 ) );
    buf                                buf0      (Q      , buf_Q                                     );
    not                                not0      (Q_N    , buf_Q                                     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_MS__EDFXBP_BEHAVIORAL_V