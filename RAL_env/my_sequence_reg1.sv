package my_sequence_reg1_pkg;

`include "uvm_macros.svh"
import uvm_pkg::*;

import my_reg_block_pkg::*;

    class my_sequence_reg1 extends uvm_sequence;
        `uvm_object_utils(my_sequence_reg1)

        my_reg_block regmodel;

        function new(string name = "my_sequence_reg1");
            super.new(name);
        endfunction

        task body;
            uvm_status_e status;
            bit [31:0] prdata;
            bit [31:0] des, mir;

            `uvm_info(get_type_name(), "\n", UVM_LOW)
            `uvm_info(get_type_name(), "##############################################", UVM_LOW)
            `uvm_info(get_type_name(), "Inside reg1 sequence", UVM_LOW)
            `uvm_info(get_type_name(), "##############################################", UVM_LOW)
            `uvm_info(get_type_name(), "\n", UVM_LOW)

            repeat(20) begin
                assert (regmodel.reg1_reg_inst.randomize());

                des = regmodel.reg1_reg_inst.get();
                `uvm_info(get_type_name(), $sformatf("reg1 desired value = %0h", des), UVM_LOW)

                regmodel.reg1_reg_inst.write(status, des, UVM_FRONTDOOR);

                #40ns;

                regmodel.reg1_reg_inst.read(status, prdata, UVM_BACKDOOR);
                `uvm_info(get_type_name(), $sformatf("reg1 frontdoor DUT register value = %0h", prdata), UVM_LOW)

                regmodel.reg1_reg_inst.sample_values();  
            end

        endtask

    endclass

endpackage