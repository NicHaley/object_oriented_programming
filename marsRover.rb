#Instructions for robots

class Robot
	attr_accessor :xCoord, :yCoord, :direction

	def initialize(xCoord, yCoord, direction)
		@xCoord = xCoord
		@yCoord = yCoord
		@direction = direction
	end

	def turnLeft(direc)
		if direc == "N"
			@direction = "W"
		elsif direc == "E"
			@direction = "N"
		elsif direc == "S"
			@direction = "E"
		elsif direc == "W"
			@direction = "S"
		end
	end

	def turnRight(direc)
		if direc == "N"
			@direction = "E"
		elsif direc == "E"
			@direction = "S"
		elsif direc == "S"
			@direction = "W"
		elsif direc == "W"
			@direction = "N"
		end
	end

	def move(direc)
		if direc == "N"
			@yCoord += 1
		elsif direc == "E"
			@xCoord += 1
		elsif direc == "S"
			@yCoord -= 1
		elsif direc == "W"
			@xCoord -= 1
		end
	end

	def read_instructions(drive)
		drive.each do |command|
			if command == "M"
				if (@yCoord <= $yGrid) && (@xCoord <= $xGrid) && (@yCoord >= 0) && (@xCoord >= 0)
					move(@direction)
				else
					puts "The robot isn't on the grid! :("
				end
			elsif command == "R"
				turnRight(@direction)
			elsif command == "L"
				turnLeft(@direction)
			end
		end
	end
end

def missionControl(robotName)

	puts "What is the starting grid size?"
	puts "Please enter the x-coordinate:"
	$xGrid = gets.chomp.to_i
	puts "Please enter the y-coordinate:"
	$yGrid = gets.chomp.to_i

	puts "Starting location for Robot1"
	puts "Please enter the x-coordinate"
	xInput = gets.chomp.to_i
	puts "Please enter the y-coordinate"
	yInput = gets.chomp.to_i
	puts "Please enter the heading"
	heading = gets.chomp.upcase.to_s

	robot = Robot.new(xInput, yInput, heading)

	puts "Please input movement sequence (L, R, or M)"
	robot.read_instructions(gets.chomp.to_s.upcase.split)

	puts "The final position for " + robotName + " is: (#{robot.xCoord}, #{robot.yCoord}, #{robot.direction})"
	print "\n\n"
end

missionControl("Robot 1")
missionControl("Robot 2")

			
