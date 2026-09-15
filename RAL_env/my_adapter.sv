package my_adapter_pkg;

`include "uvm_macros.svh"
import uvm_pkg::*;

import my_sequence_item_pkg::*;

    class my_adapter extends uvm_reg_adapter;

        `uvm_object_utils(my_adapter)

        function new(string name = "my_adapter");
            super.new(name);
            supports_byte_enable = 0;
            provides_responses = 0;
        endfunction

        function my_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
            my_sequence_item tr;
            tr = my_sequence_item::type_id::create("tr");

            tr.paddr = rw.addr;
            tr.pwrite = (rw.kind == UVM_WRITE);
            if(tr.pwrite) begin
                tr.pwdata = rw.data;
            end

            return tr;
        endfunction

        function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
            my_sequence_item tr;
            assert($cast(tr, bus_item));

            rw.kind = tr.pwrite? UVM_WRITE : UVM_READ;
            rw.data = tr.prdata;
            rw.addr = tr.paddr;
            rw.status = UVM_IS_OK;
        endfunction

    endclass

endpackage