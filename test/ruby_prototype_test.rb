require File.dirname(__FILE__) + '/../lib/ruby_prototype'

[ Object,
  Object.new,
  Class,
  (class C; self; end),
  Module,
  (module M; self; end),
  Object.method(:send)  # Even methods can have methods now
].each do |object|

  begin
    # we can assign a proc to the method
    object.method_that_takes_block = proc do |name, &b|
      print "+"
      b.call(name)
    end
    # or simply call the /=$/ form of the method while passing a block
    object.send :more_direct= do |&b|
      print "+"
      b.call(self)
    end

    object.method_that_takes_block 'some value' do |*args|
      print '+'
    end
    object.more_direct {|same_object| print '+'}

    puts "  works on #{object}"
  rescue => e
    puts "  fails on #{object} with #{e.inspect}"
  end
end
