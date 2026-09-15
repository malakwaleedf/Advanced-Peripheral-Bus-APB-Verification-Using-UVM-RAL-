package my_test_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"

import my_env_pkg::*;
import my_sequence_cntrl_pkg::*;
import my_sequence_reg1_pkg::*;
import my_sequence_reg2_pkg::*;
import my_sequence_reg3_pkg::*;
import my_sequence_reg4_pkg::*;

`define create(type , inst_name)  type::type_id::create(inst_name,this); // This is a macro to save the much code into small one for constructing
                                                                         // U can use the old one normally no problem also    


class my_test extends uvm_test;
  `uvm_component_utils(my_test)


  my_env  env;
  my_sequence_cntrl seq_cntrl;
  my_sequence_reg1 seq_reg1;
  my_sequence_reg2 seq_reg2;
  my_sequence_reg3 seq_reg3;
  my_sequence_reg4 seq_reg4;

  function new (string name = "my_test" , uvm_component parent = null);
	super.new(name , parent);
  endfunction


  function void build_phase(uvm_phase phase);
  	super.build_phase(phase);
	
      env = `create(my_env , "env");
      `uvm_info("MY_TEST" , "TEST BUILT" , UVM_LOW);
      seq_cntrl = `create(my_sequence_cntrl , "seq_cntrl");
      seq_reg1 = `create(my_sequence_reg1 , "seq_reg1");
      seq_reg2 = `create(my_sequence_reg2 , "seq_reg2");
      seq_reg3 = `create(my_sequence_reg3 , "seq_reg3");
      seq_reg4 = `create(my_sequence_reg4 , "seq_reg4");
	  
    endfunction

  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
  endfunction

  task run_phase(uvm_phase phase);
       phase.raise_objection(this);
        `uvm_info("RUN TEST" , "TEST HERE" , UVM_LOW);

        seq_cntrl.regmodel = env.regmodel;
        seq_cntrl.start(null);

        seq_reg1.regmodel = env.regmodel;
        seq_reg1.start(null);

        seq_reg2.regmodel = env.regmodel;
        seq_reg2.start(null);

        seq_reg3.regmodel = env.regmodel;
        seq_reg3.start(null);

        seq_reg4.regmodel = env.regmodel;
        seq_reg4.start(null);
        
       phase.drop_objection(this);  
    endtask

endclass

endpackage
