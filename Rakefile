require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "ruby_prototype"
    gem.summary = %Q{Provides Ruby1.9 with a method prototyping interface}
    gem.description = %Q{Allows the class-oriented Ruby language to double as a simple-object prototype language (a la Javascript)}
    gem.email = "gems@6brand.com"
    gem.homepage = "http://github.com/JackDanger/ruby_prototype"
    gem.authors = ["Jack Danger Canty"]
  end
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'rake/testtask'
task :test do
  system "ruby1.9 test/ruby_prototype_test.rb"
end

task :default => :test

