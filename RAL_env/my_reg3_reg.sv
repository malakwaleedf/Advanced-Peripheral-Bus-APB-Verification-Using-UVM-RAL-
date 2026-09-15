package my_reg3_reg_pkg;

`include "uvm_macros.svh"
import uvm_pkg::*;

    class my_reg3_reg extends uvm_reg;
        `uvm_object_utils(my_reg3_reg)

        rand uvm_reg_field reg3_data;

        covergroup reg3_reg_cov;
            coverpoint reg3_data.value{
                bins reg3_low = {['h00_00_00_00:'h1F_FF_FF_FF]};
                bins reg3_mid1 = {['h20_00_00_00:'h3F_FF_FF_FF]};
                bins reg3_mid2 = {['h40_00_00_00:'h7F_FF_FF_FF]};
                bins reg3_high = {['h80_00_00_00:'hFF_FF_FF_FF]};
            }
        endgroup

        function new(string name = "my_reg3_reg");
            super.new(name, 32, UVM_CVR_ALL);
            if(has_coverage(UVM_CVR_FIELD_VALS)) begin
                reg3_reg_cov = new();
            end
        endfunction

        function void build();
            reg3_data = uvm_reg_field::type_id::create("reg3_data");
            reg3_data.configure(.parent(this),
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
            reg3_reg_cov.sample();
        endfunction
        
    endclass
endpackage