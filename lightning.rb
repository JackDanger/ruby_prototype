# require 'rubygems'
# require 'ruby_prototype'
require File.expand_path(File.join(File.dirname(__FILE__), 'lib', 'ruby_prototype'))

User = Object.new

User.name = 'Samson'

puts User.name

User.extends = proc do |hash|
  hash.each do |property, value|
    send "#{property}=", value
  end
end

User.extends :name => 'Delilah'

puts User.name
