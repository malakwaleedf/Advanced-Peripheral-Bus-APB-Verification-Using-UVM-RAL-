package my_predictor_pkg;

`include "uvm_macros.svh"
import uvm_pkg::*;

import my_sequence_item_pkg::*;
import my_adapter_pkg::*;

    class my_predictor extends uvm_reg_predictor #(my_sequence_item);

        `uvm_component_utils(my_predictor)

        // my_adapter adapter;

        function new(string name = "my_predictor", uvm_component parent = null);
            super.new(name, parent);
        endfunction

    endclass
endpackage