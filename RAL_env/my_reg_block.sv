package my_reg_block_pkg;

`include "uvm_macros.svh"
import uvm_pkg::*;

import my_cntrl_reg_pkg::*;
import my_reg1_reg_pkg::*;
import my_reg2_reg_pkg::*;
import my_reg3_reg_pkg::*;
import my_reg4_reg_pkg::*;

    class my_reg_block extends uvm_reg_block;
        `uvm_object_utils(my_reg_block)

        rand my_cntrl_reg cntrl_reg_inst;
        rand my_reg1_reg reg1_reg_inst;
        rand my_reg2_reg reg2_reg_inst;
        rand my_reg3_reg reg3_reg_inst;
        rand my_reg4_reg reg4_reg_inst;

        function new(string name = "my_reg_block");
            super.new(name, UVM_CVR_ALL);
        endfunction

        function void build();
            cntrl_reg_inst = my_cntrl_reg::type_id::create("cntrl_reg_inst");
            cntrl_reg_inst.build();
            cntrl_reg_inst.configure(this);

            reg1_reg_inst = my_reg1_reg::type_id::create("reg1_reg_inst");
            reg1_reg_inst.build();
            reg1_reg_inst.configure(this);

            reg2_reg_inst = my_reg2_reg::type_id::create("reg2_reg_inst");
            reg2_reg_inst.build();
            reg2_reg_inst.configure(this);

            reg3_reg_inst = my_reg3_reg::type_id::create("reg3_reg_inst");
            reg3_reg_inst.build();
            reg3_reg_inst.configure(this);

            reg4_reg_inst = my_reg4_reg::type_id::create("reg4_reg_inst");
            reg4_reg_inst.build();
            reg4_reg_inst.configure(this);

            add_hdl_path("top.DUT", "RTL");
            cntrl_reg_inst.add_hdl_path_slice("cntrl", 0, 4);
            reg1_reg_inst.add_hdl_path_slice("reg1", 0, 32);
            reg2_reg_inst.add_hdl_path_slice("reg2", 0, 32);
            reg3_reg_inst.add_hdl_path_slice("reg3", 0, 32);
            reg4_reg_inst.add_hdl_path_slice("reg4", 0, 32);

            default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN);

            default_map.add_reg(cntrl_reg_inst, 'h0, "RW");
            default_map.add_reg(reg1_reg_inst, 'h4, "RW");
            default_map.add_reg(reg2_reg_inst, 'h8, "RW");
            default_map.add_reg(reg3_reg_inst, 'hc, "RW");
            default_map.add_reg(reg4_reg_inst, 'h10, "RW");

            lock_model();

        endfunction

    endclass

endpackage