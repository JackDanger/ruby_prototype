# Ruby Prototype

Note: Only works with Ruby 1.9+

In Javascript and other prototype languages you can add a
function/method to an object like so:

 obj.perform = function(){ ... stuff to do ...}

But in Ruby 1.8 there's always been a problem where a method
defined with `define_method` won't be able to take a block.
So you'd never be able to do something like this:

"my string".do_with_words = proc do |&block|
  self.split(' ').each do |word|
    block.call(word)
  end
end

Because the "proc do |&block|" was unsupported syntax.  And blocks
never got passed automatically so block_given? would always return
false.

But Ruby 1.9 allows the "proc do |&block|" syntax so we can now make
Ruby to act as a (quasi) fully prototype language.

## Usage

    require 'rubygems'
    require 'ruby_prototype'
    
    @object.self_times_two = proc do
      self * 2
    end
    
    # The above is the exact same as this, more conventional, way:
    def @object.self_times_two
      self * 2
    end
