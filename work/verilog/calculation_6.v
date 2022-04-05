/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module calculation_6 (
    input clk,
    input rst,
    input [5:0] alufn,
    input asel,
    input [3:0] bsel,
    input we,
    input [3:0] ra,
    input [3:0] rb,
    input [3:0] rc,
    input [1:0] wdsel,
    output reg [15:0] adata,
    output reg [15:0] bdata,
    output reg [11:0] led_lights
  );
  
  
  
  wire [16-1:0] M_reg_out_a;
  wire [16-1:0] M_reg_out_b;
  wire [12-1:0] M_reg_led_light;
  reg [4-1:0] M_reg_write_address;
  reg [1-1:0] M_reg_we;
  reg [16-1:0] M_reg_write_data;
  reg [4-1:0] M_reg_read_address_a;
  reg [4-1:0] M_reg_read_address_b;
  regfile_11 L_reg (
    .clk(clk),
    .rst(rst),
    .write_address(M_reg_write_address),
    .we(M_reg_we),
    .write_data(M_reg_write_data),
    .read_address_a(M_reg_read_address_a),
    .read_address_b(M_reg_read_address_b),
    .out_a(M_reg_out_a),
    .out_b(M_reg_out_b),
    .led_light(M_reg_led_light)
  );
  
  wire [16-1:0] M_alumux_unit_out;
  reg [6-1:0] M_alumux_unit_alufn;
  reg [1-1:0] M_alumux_unit_asel;
  reg [4-1:0] M_alumux_unit_bsel;
  reg [2-1:0] M_alumux_unit_wdsel;
  reg [16-1:0] M_alumux_unit_ra_data;
  reg [16-1:0] M_alumux_unit_rb_data;
  alu_mux_12 alumux_unit (
    .alufn(M_alumux_unit_alufn),
    .asel(M_alumux_unit_asel),
    .bsel(M_alumux_unit_bsel),
    .wdsel(M_alumux_unit_wdsel),
    .ra_data(M_alumux_unit_ra_data),
    .rb_data(M_alumux_unit_rb_data),
    .out(M_alumux_unit_out)
  );
  
  always @* begin
    M_alumux_unit_wdsel = wdsel;
    M_alumux_unit_asel = asel;
    M_alumux_unit_bsel = bsel;
    M_alumux_unit_alufn = alufn;
    M_reg_read_address_a = ra;
    M_reg_read_address_b = rb;
    M_reg_write_address = rc;
    M_reg_we = we;
    M_alumux_unit_ra_data = M_reg_out_a;
    M_alumux_unit_rb_data = M_reg_out_b;
    adata = M_reg_out_a;
    bdata = M_reg_out_b;
    M_reg_write_data = M_alumux_unit_out;
    led_lights = M_reg_led_light;
  end
endmodule
