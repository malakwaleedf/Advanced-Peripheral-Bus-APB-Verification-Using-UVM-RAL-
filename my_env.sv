package my_env_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"

import my_agent_pkg::* ;
import my_sequence_item_pkg::*;
import my_scoreboard_pkg::*;

import my_adapter_pkg::*;
import my_reg_block_pkg::*;
import my_predictor_pkg::*;

`define create(type , inst_name)  type::type_id::create(inst_name,this);  // CREATE() HERE REPLACES THE CONSTRUCTION LINE LARGE CODE LIKE A TEXT REPLACEMENT

class my_env extends uvm_env;
  `uvm_component_utils(my_env)


my_agent   agent     ;
my_scoreboard sco;

my_adapter adapter;
my_reg_block regmodel;
my_predictor predictor;


  function new (string name = "my_env" , uvm_component parent = null);
     super.new(name , parent);
  endfunction

  
  function void build_phase(uvm_phase phase);
     super.build_phase(phase);
   
   `uvm_info("MY_ENV" , "ENVIRONMENT BUILT" , UVM_LOW);     

   agent = `create(my_agent,"agent");       //HERE WE USED THE MACRO INSTEAD OF LARGE CODE WHICH DEFINED ABOVE
   sco   = `create(my_scoreboard,"sco"); 

   adapter = `create(my_adapter,"adapter"); 
   regmodel = `create(my_reg_block,"regmodel"); 
   predictor = my_predictor::type_id::create("predictor", this);

   regmodel.build();

  endfunction


  function void connect_phase(uvm_phase phase);
     super.connect_phase(phase);
       agent.mon.mon_ap.connect(sco.sco_ap);

       regmodel.default_map.set_sequencer(agent.seqr, adapter);
       agent.mon.mon_ap.connect(predictor.bus_in);

       predictor.map = regmodel.default_map;
       predictor.adapter = adapter;
  endfunction
  
endclass


endpackage