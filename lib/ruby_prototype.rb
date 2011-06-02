module RubyPrototype
  def method_missing(method_name, *arguments, &block)
    # Default to standard behaviour, UNLESS:
    # A. We receive an equals sign and one more parameter.
    # B. We received a block.
    return super unless method_name.to_s =~ /=$/ &&
                        ((1 == arguments.length) | block_given?)

    # If arguments is a proc and not a block, the proc is our block.
    block = arguments[0] if arguments[0].is_a?(Proc) && !block_given?
    # Otherwise, create a proc out of arguments[0], which is the code we passed in.
    # This is so that all future arguments to our proc are passed properly to our proc].
    block ||= proc {|*a| arguments[0] }

    # Define the missing method on the target class.
    # We pass the method name, stripping the '=' from any assignments.
    (class << self; self; end).send :define_method,
                                    method_name.to_s.chomp('='),
                                    &block
  end
end

if RUBY_VERSION.to_f < 1.9
  # Doesn't work on anything less than Ruby 1.9.
  warn "RUBY_VERSION 1.9+ required for RubyPrototype - skipping"
else
  # Send the message, including this module.
  Object.send :include, RubyPrototype
end
