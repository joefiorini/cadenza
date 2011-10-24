# More info at https://github.com/guard/guard#readme

guard 'rspec', :version => 2, :cli => "--color" do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^spec/fixtures/.+$}) { Dir.glob("spec/**/*_spec.rb") }

  watch("lib/cadenza/lexer.rb") { Dir.glob("spec/lexer/*_spec.rb") }

  watch("lib/cadenza/parser.rb") { Dir.glob("spec/parser/*_spec.rb") }

  watch(%r{^lib/cadenza/nodes/.+\.rb$}) { Dir.glob("spec/nodes/*_spec.rb") }
  watch('lib/cadenza/node.rb') { Dir.glob("spec/nodes/*_spec.rb") }

  watch('lib/cadenza/context.rb') { "spec/context_spec.rb" }
  watch('lib/cadenza/text_renderer.rb') { "spec/text_renderer_spec.rb" }

  watch('spec/spec_helper.rb')
end

guard 'shell' do
   watch('src/cadenza.y') { puts `rake compile:parser` }
end