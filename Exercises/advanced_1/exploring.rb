# For this exercise, we'll be learning and practicing our knowledge of the arity of 
# lambdas, procs, and implicit blocks. Two groups of code also deal with the definition 
# of a Proc and a Lambda, and the differences between the two. Run each group of code 
# below: For your answer to this exercise, write down your observations for each group 
# of code. After writing out those observations, write one final analysis that explains 
# the differences between procs, blocks, and lambdas.

# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# the proc is created with a #proc method and a block that is it's argument
# the proc is instantiated by assigning it to the local variable my_proc
# the to_s call on my_proc displays the object and encoding like custom objects to_s but
# also seems to indicate the location in the code where it is created perhaps due to 
# the nature of these things to have awareness and access to it's surrounding code 
# the #call method executes the block as if there is no parameter passed in
# the #call method with an argument passes that argument to the proc code/block
# the proc is like a method without a name stored in a local variable and #call
# is used to call the method and optionally pass in a argument which seems to pass
# nil as a default argument value.
 

puts ''
# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
#seems to be two different ways to define the same lambda

puts my_lambda
puts my_second_lambda
# these two calls to #puts demonstrates that this lambda method call is creating a Proc
# that is specified as a lambda (as if lambda is a type of proc)
puts my_lambda.class
# shows that this 'lambda' actuall as a Proc object
my_lambda.call('dog')
# works the same as the #call method with the proc object
my_lambda.call
# unlike the proc, the creation of this enclosure with the method #lambda, has made it so
# that the #call method doesn't pass in a default nil.
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }
# this last line of code creates an error because there is no such thing as a Lambda class
# from which we can instantiate a Lambda

puts ''
# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
# the block is never yielded to with an argument to pass into it so it seems that
# the block parameter is assigned nil
block_method_1('seal')
# error here because the method is expecting a block..no #block_given? gate in method def

puts ''
# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
# works as expected with the method argument yielded to the block
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
# same as last example, yields argument to the block but there is an extra block
# parameter which becomes nil

block_method_2('turtle') { puts "This is a #{animal}."}
# animal is not connected to a block parameter would work with `|animal|`


# Overall analysis:  A lambda is a type of proc that is created with the lambda method call.
#                   Procs and lambdas both behave like blocks but you cannot call the lambda if
#                   it is expecting a parameter.
#                   So the point is that lambdas have strict arity rules, it expects the right
                    # amount of parameters (like a method) but blocks and lambdas have very liberal
                    # arity rules, you don't have to pass the block parameters for it to execute