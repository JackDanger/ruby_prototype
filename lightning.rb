require 'ruby_prototype'

User = Object.new
User.name = 'Samson'

User.extends = proc do |hash|
  hash.each do |property, value|
    send "#{property}=", value
  end
end

User.extends :name => 'Delilah'

puts User.name # => 'Delilah'
