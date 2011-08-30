# More info at https://github.com/guard/guard#readme

guard 'rspec', :version => 2, :cli => "--color" do
  watch(%r{^spec/.+_spec\.rb$})

  watch("lib/lexer.rb") { Dir.glob("spec/lexer/*_spec.rb") }

  watch("lib/parser.rb") { Dir.glob("spec/parser/*_spec.rb") }

  watch(%r{^lib/nodes/*\.rb$}) { Dir.glob("spec/nodes/*_spec.rb") }
  watch('lib/node.rb') { Dir.glob("spec/nodes/*_spec.rb") }

  watch('spec/spec_helper.rb')
end
