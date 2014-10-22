module Greeting
	def hello
		puts "Hi, my name is #{@name}"
	end
end


class Person
	include Greeting

	def initialize(name)
		@name = name
	end
end


class Student < Person

	def learn
		puts "I get it!"
	end
end


class Instructor < Person

	def teach
		puts "Everything in Ruby is an object"
	end
end

instructor = Instructor.new("Chris")
instructor.hello
instructor.teach

student = Student.new("Christina")
student.hello
student.learn


#Both the student and instructor instances have access to the Module 'Greeting' by way of inheritance.
#As such, they are able to use the method 'hello' and provide a greeting with their names
#Both the student and instructor also have access to their respective instance methods, 'learn' and 'teach'.
#Problems arise when they try to call eachothers instance methods, as in the problem above.
