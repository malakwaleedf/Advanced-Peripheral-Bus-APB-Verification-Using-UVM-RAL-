package my_sequence_cntrl_pkg;

`include "uvm_macros.svh"
import uvm_pkg::*;

import my_reg_block_pkg::*;

    class my_sequence_cntrl extends uvm_sequence;
        `uvm_object_utils(my_sequence_cntrl)

        my_reg_block regmodel;

        function new(string name = "my_sequence_cntrl");
            super.new(name);
        endfunction

        task body;
            uvm_status_e status;
            bit [31:0] prdata;
            bit [31:0] des, mir;

            `uvm_info(get_type_name(), "\n", UVM_LOW)
            `uvm_info(get_type_name(), "##############################################", UVM_LOW)
            `uvm_info(get_type_name(), "Inside cntrl sequence", UVM_LOW)
            `uvm_info(get_type_name(), "##############################################", UVM_LOW)
            `uvm_info(get_type_name(), "\n", UVM_LOW)

            repeat(20) begin
                assert (regmodel.cntrl_reg_inst.randomize());

                des = regmodel.cntrl_reg_inst.CTRL0.get();
                `uvm_info(get_type_name(), $sformatf("cntrl.CTRL0 desired value = %0b", des), UVM_LOW)

                des = regmodel.cntrl_reg_inst.CTRL1.get();
                `uvm_info(get_type_name(), $sformatf("cntrl.CTRL1 desired value = %0b", des), UVM_LOW)

                des = regmodel.cntrl_reg_inst.CTRL2.get();
                `uvm_info(get_type_name(), $sformatf("cntrl.CTRL2 desired value = %0b", des), UVM_LOW)

                des = regmodel.cntrl_reg_inst.CTRL3.get();
                `uvm_info(get_type_name(), $sformatf("cntrl.CTRL3 desired value = %0b", des), UVM_LOW)

                regmodel.cntrl_reg_inst.update(status);

                #10ns;

                regmodel.cntrl_reg_inst.read(status, prdata, UVM_BACKDOOR);
                `uvm_info(get_type_name(), $sformatf("cntrl backdoor mirror value = %0h", prdata), UVM_LOW)

                regmodel.cntrl_reg_inst.sample_values();  
            end          

        endtask

    endclass

endpackage