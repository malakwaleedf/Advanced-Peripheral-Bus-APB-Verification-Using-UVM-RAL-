package my_sequence_reg2_pkg;

`include "uvm_macros.svh"
import uvm_pkg::*;

import my_reg_block_pkg::*;

    class my_sequence_reg2 extends uvm_sequence;
        `uvm_object_utils(my_sequence_reg2)

        my_reg_block regmodel;

        function new(string name = "my_sequence_reg2");
            super.new(name);
        endfunction

        task body;
            uvm_status_e status;
            bit [31:0] prdata;
            bit [31:0] des, mir;

            `uvm_info(get_type_name(), "\n", UVM_LOW)
            `uvm_info(get_type_name(), "##############################################", UVM_LOW)
            `uvm_info(get_type_name(), "Inside reg2 sequence", UVM_LOW)
            `uvm_info(get_type_name(), "##############################################", UVM_LOW)
            `uvm_info(get_type_name(), "\n", UVM_LOW)

            repeat(20) begin
                assert (regmodel.reg2_reg_inst.randomize());

                des = regmodel.reg2_reg_inst.get();
                `uvm_info(get_type_name(), $sformatf("reg2 desired value = %0h", des), UVM_LOW)

                regmodel.reg2_reg_inst.poke(status, des);

                #40ns;

                regmodel.reg2_reg_inst.peek(status, prdata);
                `uvm_info(get_type_name(), $sformatf("reg2 backdoor DUT register value = %0h", prdata), UVM_LOW)

                regmodel.reg2_reg_inst.sample_values();  
            end

        endtask

    endclass

endpackage