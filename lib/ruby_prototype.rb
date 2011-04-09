module RubyPrototype
  def method_missing(method_name, *arguments, &block)
    return super unless method_name.to_s =~ /=$/ &&
                        ((1 == arguments.length) | block_given?)

    block = arguments[0] if arguments[0].is_a?(Proc) && !block_given?
    block ||= proc {|*a| arguments[0] }
    
    (class << self; self; end).send :define_method,
                                    method_name.to_s.chomp('='),
                                    &block
  end
end

if RUBY_VERSION.to_f < 1.9
  warn "RUBY_VERSION 1.9+ required for RubyPrototype - skipping"
else
  Object.send :include, RubyPrototype
end
