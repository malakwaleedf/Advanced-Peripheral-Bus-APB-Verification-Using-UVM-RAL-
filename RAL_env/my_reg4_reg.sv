package my_reg4_reg_pkg;

`include "uvm_macros.svh"
import uvm_pkg::*;

    class my_reg4_reg extends uvm_reg;
        `uvm_object_utils(my_reg4_reg)

        rand uvm_reg_field reg4_data;

        covergroup reg4_reg_cov;
            coverpoint reg4_data.value{
                bins reg4_low = {['h00_00_00_00:'h1F_FF_FF_FF]};
                bins reg4_mid1 = {['h20_00_00_00:'h3F_FF_FF_FF]};
                bins reg4_mid2 = {['h40_00_00_00:'h7F_FF_FF_FF]};
                bins reg4_high = {['h80_00_00_00:'hFF_FF_FF_FF]};
            }
        endgroup

        function new(string name = "my_reg4_reg");
            super.new(name, 32, UVM_CVR_ALL);
            if(has_coverage(UVM_CVR_FIELD_VALS)) begin
                reg4_reg_cov = new();
            end
        endfunction

        function void build();
            reg4_data = uvm_reg_field::type_id::create("reg4_data");
            reg4_data.configure(.parent(this),
                            .size(32),
                            .lsb_pos(0),
                            .access("RW"),
                            .volatile(0),
                            .reset('h0),
                            .has_reset(1),
                            .is_rand(1),
                            .individually_accessible(1));

        endfunction

        function void sample_values();
            super.sample_values();
            reg4_reg_cov.sample();
        endfunction
        
    endclass
endpackage