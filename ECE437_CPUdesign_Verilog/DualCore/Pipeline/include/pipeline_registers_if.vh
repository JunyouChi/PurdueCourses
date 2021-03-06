`ifndef PIPELINE_REGISTER_IF_VH
`define PIPELINE_REGISTER_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface pipeline_registers_if;
  // import types
  import cpu_types_pkg::*;

  //inputs
  logic data_or_instruction_next;
  logic lw_hazard;
  logic [1:0]lw_hazard_next;
  logic branch;

/////////////////////////////////////////////////// Instruction fetch
  //IF inputs
  logic [31:0] input_Instr_IF;
  logic [31:0] input_nextPC_IF;

  //IF outputs
  logic [31:0] output_Instr_IF;


/////////////////////////////////////////////////// Instruction decode
  //ID inputs


  logic       input_MemToReg_ID;
  logic       input_PcToReg_ID;
  logic       input_Memwrite_ID; 
  logic [2:0] input_jump_ID;
  logic [1:0] input_RegDst_ID;
  logic       input_RegWen_ID;
  logic [31:0] input_ALUSrc1_ID;
  logic [31:0] input_ALUSrc2_ID;
  logic [31:0] input_RegDat2_ID;
  aluop_t      input_ALUOP_ID;
  logic       input_care_ID;
  logic       input_halt_ID;
  logic       input_hazard_Reg_ID;

  //ID outputs
  logic [31:0] output_nextPC_ID;
  logic [31:0] output_Instr_ID;
  logic [31:0] output_ALUSrc1_ID;  
  logic [31:0] output_ALUSrc2_ID;  
  aluop_t      output_ALUOP_ID;
  logic [2:0] output_jump_ID;
  logic [1:0] output_RegDst_ID;
  logic       output_care_ID;
  logic       output_halt_ID;
  logic       output_hazard_Reg_ID;//////////////////////
  logic [31:0] output_RegDat2_ID; 
  logic       output_MemToReg_ID;
  logic       output_Memwrite_ID;


/////////////////////////////////////////////////// execuation
  //EX inputs
  //logic [31:0] input_nextPC_EX;
  logic [31:0] input_Wdata_EX;
  logic [4:0]  input_RegDst_EX;
  logic [31:0] input_Result_EX;

  //EX outputs
  //logic output_ALUZero_EX;
  //logic [2:0] output_jump_t_EX;
  logic [31:0] output_Result_EX;
  logic [31:0] output_Wdata_EX;
  logic [4:0]  output_RegDst_EX;
  logic        output_RegWen_EX;
  logic        output_MemToReg_EX;
  logic        output_Memwrite_EX;

////////////////////////////////////////////////// memory --> write back
  //MEM inputs
  logic [31:0] input_ReadData_MEM;

  //MEM outputs
  logic        output_PcToReg_MEM;
  logic [31:0] output_nextPC_MEM;
  logic        output_MemToReg_MEM;
  logic [4:0]  output_RegDst_MEM;
  logic        output_RegWen_MEM;
  logic [31:0] output_ReadData_MEM;
  logic [31:0] output_CalcData_MEM;
  logic        output_halt_MEM;







endinterface

`endif //PIPELINE_REGISTER_IF_VH
