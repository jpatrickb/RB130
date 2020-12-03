#Write a minitest assertion that will fail if the value.odd? is not true.
  
assert(value.odd?)

#Write a minitest assertion that will fail if value.downcase does not return 'xyz'.

assert_equal('xyz', value.downcase)

#Write a minitest assertion that will fail if value is not nil.

assert_nil value

assert_equal nil, value

#Write a minitest assertion that will fail if the Array list is not empty.

assert_empty list
assert_equal true, list.empty?

#Write a minitest assertion that will fail if the 'xyz' is not in the Array list.

assert_include list, 'xyz'
assert_equal true, list.include?('xyz')

#Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError 
#exception.

assert_raises NoExperienceError do 
  employee.hire
end

#Write a minitest assertion that will fail if value is not an instance of the Numeric class 
#exactly. value may not be an instance of one of Numeric's superclasses.

assert_instance_of Numeric, value

#Write a minitest assertion that will fail if the class of value is not Numeric or one of 
#Numeric's subclasses (e.g., Integer, Float, etc).

assert_kind_of Numeric, value

#Write a test that will fail if list and the return value of list.process are different objects.

assert_same list, list.process

#Write a test that will fail if 'xyz' is one of the elements in the Array list:

refute_includes list, 'xyz'