package my_sequence_reg3_pkg;

`include "uvm_macros.svh"
import uvm_pkg::*;

import my_reg_block_pkg::*;

    class my_sequence_reg3 extends uvm_sequence;
        `uvm_object_utils(my_sequence_reg3)

        my_reg_block regmodel;

        function new(string name = "my_sequence_reg3");
            super.new(name);
        endfunction

        task body;
            uvm_status_e status;
            bit [31:0] prdata;
            bit [31:0] des, mir;

            `uvm_info(get_type_name(), "\n", UVM_LOW)
            `uvm_info(get_type_name(), "##############################################", UVM_LOW)
            `uvm_info(get_type_name(), "Inside reg3 sequence", UVM_LOW)
            `uvm_info(get_type_name(), "##############################################", UVM_LOW)
            `uvm_info(get_type_name(), "\n", UVM_LOW)

            repeat(20) begin
                assert (regmodel.reg3_reg_inst.randomize());

                des = regmodel.reg3_reg_inst.get();
                `uvm_info(get_type_name(), $sformatf("reg3 desired value = %0h", des), UVM_LOW)

                regmodel.reg3_reg_inst.poke(status, des);

                #40ns;

                mir = regmodel.reg3_reg_inst.get_mirrored_value();
                `uvm_info(get_type_name(), $sformatf("reg3 mirrored value = %0h", mir), UVM_LOW)

                regmodel.reg3_reg_inst.sample_values();  
            end

        endtask

    endclass

endpackage