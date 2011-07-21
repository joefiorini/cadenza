#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.6
# from Racc grammer file "".
#

require 'racc/parser.rb'

# parser.rb : generated by racc
  
module Cadenza
  class Parser < Racc::Parser

module_eval(<<'...end cadenza.y/module_eval...', 'cadenza.y', 28)
attr_reader :lexer

def initialize(options={})
  @lexer = options.fetch(:lexer, Cadenza::Lexer.new)

  raise "Lexers passed to the parser must define next_token" unless @lexer.respond_to?(:next_token)

  raise "Lexers passed to the parser must define source=" unless @lexer.respond_to?(:source=)
end

def parse(source)
  @lexer.source = source
  @document = DocumentNode.new
  do_parse
  @document
end

def next_token
  @lexer.next_token
end
...end cadenza.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
     6,     7,     8,     9,    10,     2,    11,    12 ]

racc_action_check = [
     2,     2,     2,     2,     3,     0,     5,    10 ]

racc_action_pointer = [
    -1,   nil,    -2,     4,   nil,    -1,   nil,   nil,   nil,   nil,
     7,   nil,   nil ]

racc_action_default = [
    -2,    -8,    -9,    -9,    -1,    -9,    -3,    -4,    -5,    -6,
    -9,    -7,    13 ]

racc_goto_table = [
     3,     4,     5,     1 ]

racc_goto_check = [
     1,     2,     3,     4 ]

racc_goto_pointer = [
   nil,     0,     1,     0,     3 ]

racc_goto_default = [
   nil,   nil,   nil,   nil,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 9, :_reduce_none,
  0, 9, :_reduce_2,
  1, 11, :_reduce_3,
  1, 11, :_reduce_4,
  1, 11, :_reduce_5,
  1, 11, :_reduce_6,
  3, 12, :_reduce_7,
  1, 10, :_reduce_8 ]

racc_reduce_n = 9

racc_shift_n = 13

racc_token_table = {
  false => 0,
  :error => 1,
  :IDENTIFIER => 2,
  :INTEGER => 3,
  :REAL => 4,
  :STRING => 5,
  :VAR_OPEN => 6,
  :VAR_CLOSE => 7 }

racc_nt_base = 8

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "IDENTIFIER",
  "INTEGER",
  "REAL",
  "STRING",
  "VAR_OPEN",
  "VAR_CLOSE",
  "$start",
  "target",
  "document",
  "primary_expression",
  "inject_statement" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

# reduce 1 omitted

module_eval(<<'.,.,', 'cadenza.y', 5)
  def _reduce_2(val, _values, result)
     result = nil 
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 9)
  def _reduce_3(val, _values, result)
     result = VariableNode.new(val[0].value) 
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 10)
  def _reduce_4(val, _values, result)
     result = ConstantNode.new(val[0].value) 
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 11)
  def _reduce_5(val, _values, result)
     result = ConstantNode.new(val[0].value) 
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 12)
  def _reduce_6(val, _values, result)
     result = ConstantNode.new(val[0].value) 
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 16)
  def _reduce_7(val, _values, result)
     result = InjectNode.new(val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 20)
  def _reduce_8(val, _values, result)
     @document.children.push(val[0]) 
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

  end   # class Parser
  end   # module Cadenza
