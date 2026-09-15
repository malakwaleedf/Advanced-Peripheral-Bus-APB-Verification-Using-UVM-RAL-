package my_cntrl_reg_pkg;

`include "uvm_macros.svh"
import uvm_pkg::*;

    class my_cntrl_reg extends uvm_reg;
        `uvm_object_utils(my_cntrl_reg)

        rand uvm_reg_field CTRL0;
        rand uvm_reg_field CTRL1;
        rand uvm_reg_field CTRL2;
        rand uvm_reg_field CTRL3;
        uvm_reg_field RESERVED;

        covergroup cntrl_reg_cov;
            coverpoint CTRL0.value{
                bins CTRL0_0 = {0};
                bins CTRL0_1 = {1};
                bins CTRL0_0_1 = (0 => 1);
                bins CTRL0_1_0 = (1 => 0);
            }

            coverpoint CTRL1.value{
                bins CTRL1_0 = {0};
                bins CTRL1_1 = {1};
                bins CTRL1_0_1 = (0 => 1);
                bins CTRL1_1_0 = (1 => 0);
            }

            coverpoint CTRL2.value{
                bins CTRL2_0 = {0};
                bins CTRL2_1 = {1};
                bins CTRL2_0_1 = (0 => 1);
                bins CTRL2_1_0 = (1 => 0);
            }

            coverpoint CTRL3.value{
                bins CTRL3_0 = {0};
                bins CTRL3_1 = {1};
                bins CTRL3_0_1 = (0 => 1);
                bins CTRL3_1_0 = (1 => 0);
            }
        endgroup

        function new(string name = "my_cntrl_reg");
            super.new(name, 32, UVM_CVR_ALL);
            if(has_coverage(UVM_CVR_FIELD_VALS)) begin
                cntrl_reg_cov = new();
            end
        endfunction

        function void build();
            CTRL0 = uvm_reg_field::type_id::create("CTRL0");
            CTRL0.configure(.parent(this),
                            .size(1),
                            .lsb_pos(0),
                            .access("RW"),
                            .volatile(0),
                            .reset(1'b0),
                            .has_reset(1),
                            .is_rand(1),
                            .individually_accessible(1));

            CTRL1 = uvm_reg_field::type_id::create("CTRL1");
            CTRL1.configure(.parent(this),
                            .size(1),
                            .lsb_pos(1),
                            .access("RW"),
                            .volatile(0),
                            .reset(1'b0),
                            .has_reset(1),
                            .is_rand(1),
                            .individually_accessible(1));
            
            CTRL2 = uvm_reg_field::type_id::create("CTRL2");
            CTRL2.configure(.parent(this),
                            .size(1),
                            .lsb_pos(2),
                            .access("RW"),
                            .volatile(0),
                            .reset(1'b0),
                            .has_reset(1),
                            .is_rand(1),
                            .individually_accessible(1));

            CTRL3 = uvm_reg_field::type_id::create("CTRL3");
            CTRL3.configure(.parent(this),
                            .size(1),
                            .lsb_pos(3),
                            .access("RW"),
                            .volatile(0),
                            .reset(1'b0),
                            .has_reset(1),
                            .is_rand(1),
                            .individually_accessible(1));

            RESERVED = uvm_reg_field::type_id::create("RESERVED");
            RESERVED.configure(.parent(this),
                            .size(28),
                            .lsb_pos(4),
                            .access("RO"),
                            .volatile(0),
                            .reset('h0),
                            .has_reset(1),
                            .is_rand(1),
                            .individually_accessible(1));

        endfunction

        function void sample_values();
            super.sample_values();
            cntrl_reg_cov.sample();
        endfunction
        
    endclass
endpackage