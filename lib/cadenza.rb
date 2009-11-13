#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.6
# from Racc grammer file "".
#

require 'racc/parser.rb'


# cadenza.rb : generated by racc

require File.join(File.dirname(__FILE__), 'cadenza_node')
require File.join(File.dirname(__FILE__), 'cadenza_lexer')

module Cadenza
  class Parser < Racc::Parser

module_eval(<<'...end cadenza.y/module_eval...', 'cadenza.y', 174)
attr_accessor :loader, :filters
attr_accessor :log_lexer, :log_parser

def initialize(loader=nil, *args)
	super(*args)
	@loader = loader
	@filters = {}
	@lexer = Cadenza::Lexer.new
end

def make_node(klass,*args)
	args.push(@lexer.line)
	args.push(@lexer.column)
	return klass.new(*args)
end

def push_token(token)
	@q.push(token)
	puts "Lexer: Token found #{token[0].to_s}(#{token[1].to_s})" if self.log_lexer
end
 
  def parse( str )
	@lexer.source = str
	@document_stack = [DocumentNode.new]
    do_parse
    return @document_stack.first
  end

  def next_token
    @lexer.next_token
  end

  def on_error(error_token_id, error_value, value_stack)
	msg = "parse error on #{token_to_str(error_token_id)} #{error_value}"
	raise ParseError, msg
  end

...end cadenza.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
    40,    41,    80,    11,    81,     3,    11,    11,     3,     3,
    11,    11,     3,    88,    84,    42,     2,    43,    76,     2,
     2,    40,    41,    19,    19,    11,    11,     3,    94,    47,
    48,    49,    50,    51,    52,    11,    82,     3,     2,    19,
    11,    11,    38,    93,    40,    41,    36,    74,     2,    37,
    85,    67,    62,    19,    19,    12,    62,    96,    57,    13,
    56,    12,    14,    55,    15,    13,    54,    12,    14,    92,
    15,    13,    53,    12,    14,    39,    15,    13,    35,    97,
    14,    12,    15,    58,    59,    13,    44,    45,    14,    95,
    15,    27,    28,    29,    30,    31,    27,    28,    29,    30,
    31,    27,    28,    29,    30,    31,    27,    28,    29,    30,
    31,    27,    28,    29,    30,    31,    27,    28,    29,    30,
    31,    27,    28,    29,    30,    31,    27,    28,    29,    30,
    31,    27,    28,    29,    30,    31,    27,    28,    29,    30,
    31,    27,    28,    29,    30,    31,    27,    28,    29,    30,
    31,    27,    28,    29,    30,    31,    27,    28,    29,    30,
    31,    27,    28,    29,    30,    31,    44,    45,    44,    45,
    40,    41,    40,    41,    40,    41,    40,    41,    40,    41,
    40,    41,    40,    41,    40,    41,    34,    17,    98,    99 ]

racc_action_check = [
    25,    25,    64,    87,    64,    87,     4,    84,     4,    84,
     7,    83,     7,    83,    77,    25,    87,    25,    58,     4,
    84,    32,    32,     7,    83,    75,    91,    75,    91,    32,
    32,    32,    32,    32,    32,     0,    74,     0,    75,    91,
    16,    89,    16,    89,    46,    46,    15,    54,     0,    15,
    79,    46,    80,    16,    89,    93,    42,    93,    37,    93,
    36,    88,    93,    35,    93,    88,    34,     3,    88,    88,
    88,     3,    33,    94,     3,    17,     3,    94,    14,    94,
    94,    38,    94,    38,    38,    38,    26,    26,    38,    92,
    38,    40,    40,    40,    40,    40,    85,    85,    85,    85,
    85,    12,    12,    12,    12,    12,    62,    62,    62,    62,
    62,    11,    11,    11,    11,    11,    51,    51,    51,    51,
    51,    31,    31,    31,    31,    31,    44,    44,    44,    44,
    44,    45,    45,    45,    45,    45,    52,    52,    52,    52,
    52,    47,    47,    47,    47,    47,    48,    48,    48,    48,
    48,    49,    49,    49,    49,    49,    50,    50,    50,    50,
    50,    41,    41,    41,    41,    41,    60,    60,    61,    61,
    78,    78,    90,    90,    68,    68,    69,    69,    70,    70,
    71,    71,    72,    72,    73,    73,    13,     6,    96,    97 ]

racc_action_pointer = [
    15,   nil,   nil,    44,   -14,   nil,   187,   -10,   nil,   nil,
   nil,   105,    95,   180,    69,    40,    20,    75,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,    -4,    84,   nil,   nil,   nil,
   nil,   115,    17,    48,    38,    39,    36,    34,    58,   nil,
    85,   155,    50,   nil,   120,   125,    40,   135,   140,   145,
   150,   110,   130,   nil,    41,   nil,   nil,   nil,    -6,   nil,
   164,   166,   100,   nil,   -17,   nil,   nil,   nil,   170,   172,
   174,   176,   178,   180,    12,     5,   nil,   -10,   166,    32,
    46,   nil,   nil,    -9,   -13,    90,   nil,   -17,    38,    21,
   168,     6,    65,    32,    50,   nil,   164,   165,   nil,   nil ]

racc_action_default = [
    -2,   -40,   -39,   -51,   -51,   -41,   -51,    -1,   -42,   -43,
   -44,   -51,   -51,   -51,   -51,   -51,   -51,   -51,   -46,   -45,
   -47,   -48,   -49,   -50,    -8,   -51,   -11,    -3,    -4,    -5,
    -6,   -51,   -14,   -51,   -51,   -51,   -51,   -51,   -51,   100,
   -51,   -51,   -51,   -27,   -51,   -51,   -51,   -51,   -51,   -51,
   -51,   -51,   -51,   -29,   -51,   -35,   -38,   -37,   -51,   -31,
   -12,   -13,   -23,   -25,   -51,    -9,   -10,    -7,   -15,   -16,
   -17,   -18,   -19,   -20,   -51,   -51,   -30,   -51,   -21,   -24,
   -51,   -28,   -33,   -51,   -51,   -51,   -26,   -51,   -51,   -51,
   -22,   -51,   -51,   -51,   -51,   -36,   -51,   -51,   -32,   -34 ]

racc_goto_table = [
     7,    22,    63,    64,    16,    77,    18,    25,    32,    79,
    22,    60,    61,    20,    87,    18,    23,    21,    65,    66,
    33,    75,    20,     6,   nil,    23,    21,    46,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
    86,   nil,   nil,    68,    69,    70,    71,    72,    73,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    78,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,    83,   nil,    22,   nil,   nil,
   nil,    90,    18,    22,    89,    22,   nil,    91,    18,    20,
    18,   nil,    23,    21,   nil,    20,   nil,    20,    23,    21,
    23,    21 ]

racc_goto_check = [
     2,    16,     8,     9,     2,    13,    10,     4,     4,     7,
    16,     5,     5,    12,    15,    10,    18,    14,     3,     3,
     6,    17,    12,     1,   nil,    18,    14,     4,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
     8,   nil,   nil,     4,     4,     4,     4,     4,     4,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,     4,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,     2,   nil,    16,   nil,   nil,
   nil,     4,    10,    16,     2,    16,   nil,     2,    10,    12,
    10,   nil,    18,    14,   nil,    12,   nil,    12,    18,    14,
    18,    14 ]

racc_goto_pointer = [
   nil,    23,     0,   -26,    -4,   -29,     8,   -53,   -40,   -39,
    -1,   nil,     6,   -54,    10,   -68,    -6,   -34,     9 ]

racc_goto_default = [
   nil,   nil,   nil,    24,   nil,    26,   nil,   nil,   nil,   nil,
     1,     4,     5,   nil,     8,   nil,     9,   nil,    10 ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 35, :_reduce_none,
  0, 35, :_reduce_2,
  1, 37, :_reduce_3,
  1, 37, :_reduce_4,
  1, 37, :_reduce_5,
  1, 37, :_reduce_6,
  3, 37, :_reduce_7,
  1, 39, :_reduce_none,
  3, 39, :_reduce_9,
  3, 39, :_reduce_10,
  1, 38, :_reduce_none,
  3, 38, :_reduce_12,
  3, 38, :_reduce_13,
  1, 40, :_reduce_none,
  3, 40, :_reduce_15,
  3, 40, :_reduce_16,
  3, 40, :_reduce_17,
  3, 40, :_reduce_18,
  3, 40, :_reduce_19,
  3, 40, :_reduce_20,
  1, 41, :_reduce_21,
  3, 41, :_reduce_22,
  1, 42, :_reduce_23,
  2, 42, :_reduce_24,
  1, 43, :_reduce_25,
  3, 43, :_reduce_26,
  3, 44, :_reduce_27,
  5, 44, :_reduce_28,
  4, 45, :_reduce_29,
  5, 46, :_reduce_30,
  0, 47, :_reduce_31,
  10, 46, :_reduce_32,
  0, 49, :_reduce_33,
  11, 48, :_reduce_34,
  0, 51, :_reduce_35,
  9, 50, :_reduce_36,
  4, 52, :_reduce_37,
  4, 52, :_reduce_38,
  1, 36, :_reduce_39,
  1, 36, :_reduce_40,
  1, 36, :_reduce_41,
  1, 36, :_reduce_42,
  1, 36, :_reduce_43,
  1, 36, :_reduce_44,
  2, 36, :_reduce_45,
  2, 36, :_reduce_46,
  2, 36, :_reduce_47,
  2, 36, :_reduce_48,
  2, 36, :_reduce_49,
  2, 36, :_reduce_50 ]

racc_reduce_n = 51

racc_shift_n = 100

racc_token_table = {
  false => 0,
  :error => 1,
  "*" => 2,
  "/" => 3,
  "+" => 4,
  "-" => 5,
  :IDENTIFIER => 6,
  :INTEGER => 7,
  :REAL => 8,
  :STRING => 9,
  "(" => 10,
  ")" => 11,
  :OP_EQ => 12,
  :OP_NEQ => 13,
  :OP_GEQ => 14,
  :OP_LEQ => 15,
  ">" => 16,
  "<" => 17,
  "," => 18,
  "|" => 19,
  :VAR_OPEN => 20,
  :VAR_CLOSE => 21,
  :STMT_OPEN => 22,
  :IF => 23,
  :STMT_CLOSE => 24,
  :ENDIF => 25,
  :ELSE => 26,
  :FOR => 27,
  :IN => 28,
  :ENDFOR => 29,
  :BLOCK => 30,
  :ENDBLOCK => 31,
  :EXTENDS => 32,
  :TEXT_BLOCK => 33 }

racc_nt_base = 34

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
  "\"*\"",
  "\"/\"",
  "\"+\"",
  "\"-\"",
  "IDENTIFIER",
  "INTEGER",
  "REAL",
  "STRING",
  "\"(\"",
  "\")\"",
  "OP_EQ",
  "OP_NEQ",
  "OP_GEQ",
  "OP_LEQ",
  "\">\"",
  "\"<\"",
  "\",\"",
  "\"|\"",
  "VAR_OPEN",
  "VAR_CLOSE",
  "STMT_OPEN",
  "IF",
  "STMT_CLOSE",
  "ENDIF",
  "ELSE",
  "FOR",
  "IN",
  "ENDFOR",
  "BLOCK",
  "ENDBLOCK",
  "EXTENDS",
  "TEXT_BLOCK",
  "$start",
  "target",
  "document",
  "primary_expression",
  "additive_expression",
  "multiplicative_expression",
  "boolean_expression",
  "param_list",
  "filter",
  "filter_list",
  "inject_statement",
  "if_statement",
  "if_block",
  "@1",
  "for_block",
  "@2",
  "block_block",
  "@3",
  "extends_statement" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

# reduce 1 omitted

module_eval(<<'.,.,', 'cadenza.y', 11)
  def _reduce_2(val, _values, result)
     result = nil 
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 15)
  def _reduce_3(val, _values, result)
     result = make_node(VariableNode, val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 16)
  def _reduce_4(val, _values, result)
     result = make_node(ConstantNode, val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 17)
  def _reduce_5(val, _values, result)
     result = make_node(ConstantNode, val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 18)
  def _reduce_6(val, _values, result)
     result = make_node(ConstantNode, val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 19)
  def _reduce_7(val, _values, result)
     result = val[1] 
    result
  end
.,.,

# reduce 8 omitted

module_eval(<<'.,.,', 'cadenza.y', 24)
  def _reduce_9(val, _values, result)
     result = make_node(ArithmeticNode,val[0],val[2],'*')
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 25)
  def _reduce_10(val, _values, result)
     result = make_node(ArithmeticNode,val[0],val[2],'/')
    result
  end
.,.,

# reduce 11 omitted

module_eval(<<'.,.,', 'cadenza.y', 30)
  def _reduce_12(val, _values, result)
     result = make_node(ArithmeticNode,val[0],val[2],'+')
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 31)
  def _reduce_13(val, _values, result)
     result = make_node(ArithmeticNode,val[0],val[2],'-')
    result
  end
.,.,

# reduce 14 omitted

module_eval(<<'.,.,', 'cadenza.y', 36)
  def _reduce_15(val, _values, result)
     result = make_node(BooleanNode,val[0],val[2],'==')
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 37)
  def _reduce_16(val, _values, result)
     result = make_node(BooleanNode,val[0],val[2],'!=')
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 38)
  def _reduce_17(val, _values, result)
     result = make_node(BooleanNode,val[0],val[2],'>=')
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 39)
  def _reduce_18(val, _values, result)
     result = make_node(BooleanNode,val[0],val[2],'<=')
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 40)
  def _reduce_19(val, _values, result)
     result = make_node(BooleanNode,val[0],val[2],'>') 
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 41)
  def _reduce_20(val, _values, result)
     result = make_node(BooleanNode,val[0],val[2],'<') 
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 45)
  def _reduce_21(val, _values, result)
     result = [val[0]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 46)
  def _reduce_22(val, _values, result)
     result = val[0].push(val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 50)
  def _reduce_23(val, _values, result)
     result = [val[0], []    ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 51)
  def _reduce_24(val, _values, result)
     result = [val[0], val[1]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 55)
  def _reduce_25(val, _values, result)
     result = [val[0]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 56)
  def _reduce_26(val, _values, result)
     result = val[0].push(val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 60)
  def _reduce_27(val, _values, result)
     result = make_node(InjectNode,val[1],[])     
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 61)
  def _reduce_28(val, _values, result)
     result = make_node(InjectNode,val[1],val[3]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 67)
  def _reduce_29(val, _values, result)
      			@document_stack.push(DocumentNode.new)
  			result = val[2]
  		
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 74)
  def _reduce_30(val, _values, result)
     result = make_node(IfNode, val[0], @document_stack.pop.children, nil) 
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 76)
  def _reduce_31(val, _values, result)
     @document_stack.push(DocumentNode.new) 
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 79)
  def _reduce_32(val, _values, result)
       	  		else_body, body = @document_stack.pop, @document_stack.pop
   	  		result = make_node(IfNode, val[0], body.children, else_body.children)
   	  	
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 86)
  def _reduce_33(val, _values, result)
     @document_stack.push(DocumentNode.new) 
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 90)
  def _reduce_34(val, _values, result)
      			result = make_node(ForNode, val[2], val[4])
  			result.children = @document_stack.pop.children
  		
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 97)
  def _reduce_35(val, _values, result)
     @document_stack.push( make_node(BlockNode, val[2]) ) 
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 101)
  def _reduce_36(val, _values, result)
      	  		result = @document_stack.pop
  	  		result.children = @document_stack.pop.children
  	  	
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 107)
  def _reduce_37(val, _values, result)
     result = val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 108)
  def _reduce_38(val, _values, result)
     result = val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 114)
  def _reduce_39(val, _values, result)
      			@document_stack.last.children.push( make_node(TextNode,val[0]) )
  		
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 118)
  def _reduce_40(val, _values, result)
      			@document_stack.last.children.push( val[0] )
  		
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 122)
  def _reduce_41(val, _values, result)
      			@document_stack.last.children.push( val[0] )
  		
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 126)
  def _reduce_42(val, _values, result)
      			@document_stack.last.children.push( val[0] )
  		
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 130)
  def _reduce_43(val, _values, result)
      			@document_stack.last.children.push( val[0] )
  			@document_stack.each { |doc| doc.blocks.store(val[0].name, val[0]) }
  		
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 135)
  def _reduce_44(val, _values, result)
      			@document_stack.first.extends = val[0]
  		
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 139)
  def _reduce_45(val, _values, result)
      			@document_stack.last.children.push( make_node(TextNode,val[1]) )
  		
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 143)
  def _reduce_46(val, _values, result)
      			@document_stack.last.children.push( val[1] )
  		
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 147)
  def _reduce_47(val, _values, result)
      			@document_stack.last.children.push( val[1] )
  		
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 151)
  def _reduce_48(val, _values, result)
      			@document_stack.last.children.push( val[1] )
  		
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 155)
  def _reduce_49(val, _values, result)
      			@document_stack.last.children.push( val[1] )
  		
    result
  end
.,.,

module_eval(<<'.,.,', 'cadenza.y', 159)
  def _reduce_50(val, _values, result)
      			@document_stack.first.extends = val[0]
  		
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

  end   # class Parser
  end   # module Cadenza

if __FILE__ == $0
	parser = CadenzaParser.new
	count = 0
	scnt  = 0
	
	puts
	puts 'type "Q" to quit.'
	puts
	
	while true do
	  puts
	  print '? '
	  str = gets.chop!
	  break if /q/i === str
	
	  begin
	    val = parser.parse( str )
	    print '= ', val, "\n"
	    puts "type of value: #{val.class}"
	  rescue ParseError
	    puts $!
	  rescue
	    puts 'unexpected error ?!'
	    raise
	  end
	
	end
end
