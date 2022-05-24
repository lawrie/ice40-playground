/*
 * boards.vh
 *
 * vim: ts=4 sw=4 syntax=verilog
 *
 * Copyright (C) 2021  Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: CERN-OHL-P-2.0
 */

`ifdef BOARD_BITSY_V0
	// 1bitsquared iCEbreaker bitsy prototypes (v0.x)
	`define HAS_USB
`elsif BOARD_BITSY_V1
	// 1bitsquared iCEbreaker bitsy prod (v1.x)
	`define HAS_USB
`elsif BOARD_REDIP_SID
	// reDIP-SID
	`define HAS_USB
	`define PLL_CORE
	`define PLL_CUSTOM
	`define PLL_FILTER_RANGE 3'b010
	`define PLL_DIVR 4'b0000
	`define PLL_DIVF 7'b0010111
	`define PLL_DIVQ 3'b010
`elsif BOARD_BLACKICE
    `define HAS_UART
    `define PLL_CORE
    `define PLL_CUSTOM
    `define PLL_FILTER_RANGE 3'b010
    `define PLL_DIVR 4'b0000
    `define PLL_DIVF 7'b0011100
    `define PLL_DIVQ 3'b010
	`define SYS_FREQ 45e6
`endif

// Defaults
	// If no USB, use UART
`ifndef HAS_USB
	`define HAS_UART
`endif

	// PLL params
`ifndef PLL_CUSTOM
	`define PLL_FILTER_RANGE 3'b001
	`define PLL_DIVR 4'b0000

		// 48
//	`define PLL_DIVF 7'b0111111
//	`define PLL_DIVQ 3'b100
//	`define SYS_FREQ 12e6

		// 96
//	`define PLL_DIVF 7'b0111111
//	`define PLL_DIVQ 3'b011
//	`define SYS_FREQ 24e6

		// 144
//	`define PLL_DIVF 7'b0101111
//	`define PLL_DIVQ 3'b010
//	`define SYS_FREQ 36e6

		// 147
	`define PLL_DIVF 7'b0110000
	`define PLL_DIVQ 3'b010
	`define SYS_FREQ 36.75e6

		// 180
//	`define PLL_DIVF 7'b0111011
//	`define PLL_DIVQ 3'b010
//	`define SYS_FREQ 45e6

		// 200
//	`define PLL_DIVF 7'b1000010
//	`define PLL_DIVQ 3'b010
//	`define SYS_FREQ 50e6
`endif
