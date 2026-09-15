package my_sequence_reg4_pkg;

`include "uvm_macros.svh"
import uvm_pkg::*;

import my_reg_block_pkg::*;

    class my_sequence_reg4 extends uvm_sequence;
        `uvm_object_utils(my_sequence_reg4)

        my_reg_block regmodel;

        function new(string name = "my_sequence_reg4");
            super.new(name);
        endfunction

        task body;
            uvm_status_e status;
            bit [31:0] prdata;
            bit [31:0] des, mir;

            `uvm_info(get_type_name(), "\n", UVM_LOW)
            `uvm_info(get_type_name(), "##############################################", UVM_LOW)
            `uvm_info(get_type_name(), "Inside reg4 sequence", UVM_LOW)
            `uvm_info(get_type_name(), "##############################################", UVM_LOW)
            `uvm_info(get_type_name(), "\n", UVM_LOW)

            repeat(20) begin
                assert (regmodel.reg4_reg_inst.randomize());

                des = regmodel.reg4_reg_inst.get();
                `uvm_info(get_type_name(), $sformatf("reg4 desired value = %0h", des), UVM_LOW)

                regmodel.reg4_reg_inst.update(status);

                #40ns;

                regmodel.reg4_reg_inst.peek(status, prdata);
                `uvm_info(get_type_name(), $sformatf("reg4 backdoor DUT register value = %0h", prdata), UVM_LOW)

                regmodel.reg4_reg_inst.predict(prdata);

                mir = regmodel.reg4_reg_inst.get_mirrored_value();
                `uvm_info(get_type_name(), $sformatf("reg4 mirrored value = %0h", mir), UVM_LOW)

                regmodel.reg4_reg_inst.sample_values();  
            end

        endtask

    endclass

endpackage