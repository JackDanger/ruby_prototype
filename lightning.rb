require 'ruby_prototype'

User = Object.new
User.name = 'Samson'
# The 'name' property springs into existence on the User object.

# We can also pass procs!
User.extends = proc do |hash|
  hash.each do |property, value|
    send "#{property}=", value
  end
end

# Here's an example of passing a hash to the proc we just created.
User.extends :name => 'Delilah'

puts User.name # => 'Delilah'
