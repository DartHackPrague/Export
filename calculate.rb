#!/usr/bin/env ruby

load 'config.rb'

file = File.open("top_night_coder.txt", "rb")
contents = file.read

lines = contents.split("\n")

teams = []
results = []

lines.each_with_index do |line, line_index|
	next if line_index == 0 or line_index == 1

	numbers = line.split "\t\t"
	weighted_line = [] 
	numbers.each_with_index do |number, index|
		if index != 0
		  weighted_number = number.strip * multipliers[index-1]
			print "#{weighted_number} "
			weighted_line << weighted_number	
		else
			teams << number.split[0] if line_index > 2
			print "#{number} "
		end
	end
	
	if line_index > 2
		sum = weighted_line.inject(0, :+)
		print " | #{sum}"
		results << sum 
	end
	
	puts
end

puts lines[2]

teams.each_with_index do |v, i|
	puts "#{v} - #{results[i]}"
end

puts lines[2]

puts "Winner is #{teams[results.find_index(results.max)]} with #{results.max} points!"