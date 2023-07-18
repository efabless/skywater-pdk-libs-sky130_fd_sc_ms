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


`ifndef SKY130_FD_SC_MS__DLRTN_2_TIMING_PP_V
`define SKY130_FD_SC_MS__DLRTN_2_TIMING_PP_V

/**
 * dlrtn: Delay latch, inverted reset, inverted enable, single output.
 *
 * Verilog simulation timing model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dlatch_pr_pp_pg_n/sky130_fd_sc_ms__udp_dlatch_pr_pp_pg_n.v"

`celldefine
module sky130_fd_sc_ms__dlrtn_2 (
    Q      ,
    RESET_B,
    D      ,
    GATE_N ,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);

    // Module ports
    output Q      ;
    input  RESET_B;
    input  D      ;
    input  GATE_N ;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;

    // Local signals
    wire RESET          ;
    wire intgate        ;
    reg  notifier       ;
    wire D_delayed      ;
    wire GATE_N_delayed ;
    wire RESET_delayed  ;
    wire RESET_B_delayed;
    wire buf_Q          ;
    wire awake          ;
    wire cond0          ;
    wire cond1          ;

    //                                     Name     Output   Other arguments
    not                                    not0    (RESET  , RESET_B_delayed                                );
    not                                    not1    (intgate, GATE_N_delayed                                 );
    sky130_fd_sc_ms__udp_dlatch$PR_pp$PG$N dlatch0 (buf_Q  , D_delayed, intgate, RESET, notifier, VPWR, VGND);
    assign awake = ( VPWR === 1'b1 );
    assign cond0 = ( awake && ( RESET_B_delayed === 1'b1 ) );
    assign cond1 = ( awake && ( RESET_B === 1'b1 ) );
    buf                                    buf0    (Q      , buf_Q                                          );

specify
( negedge RESET_B => ( Q +: RESET_B ) ) = ( 0:0:0 , 0:0:0 ) ;  // delay is tfall
( D +=> Q ) = ( 0:0:0 , 0:0:0 ) ;  // delays are tris , tfall
( negedge GATE_N => ( Q : GATE_N ) ) = ( 0:0:0 , 0:0:0 ) ; // delays are tris , tfall
$recrem ( posedge RESET_B , posedge GATE_N , 0:0:0 , 0:0:0 , notifier , awake , awake , RESET_B_delayed , GATE_N_delayed ) ;
$setuphold ( posedge GATE_N , posedge D , 0:0:0 , 0:0:0 , notifier , cond0 , cond0 , GATE_N_delayed , D_delayed ) ;
$setuphold ( posedge GATE_N , negedge D , 0:0:0 , 0:0:0 , notifier , cond0 , cond0 , GATE_N_delayed , D_delayed ) ;
$width ( negedge GATE_N &&& cond1 , 1.0:1.0:1.0 , 0 , notifier ) ;
$width ( negedge RESET_B &&& awake , 1.0:1.0:1.0 , 0 , notifier ) ;
$width ( posedge RESET_B &&& awake , 1.0:1.0:1.0 , 0 , notifier ) ;
endspecify
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_MS__DLRTN_2_TIMING_PP_V
