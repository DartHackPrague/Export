#!/usr/bin/ruby

require 'pathname'

first_project = 'dart_music'

ARGF.each_with_index do |line, idx|
		if idx == 0
			numbers = line.gsub('>', '> ').gsub( %r{</?[^>]+?>}, '' ).gsub('%', '').split(' ')
			pn = Pathname.new("#{Dir.pwd}.path").parent.basename
			
			i = 0
			if pn.eql? first_project
				print "Hour \t\t"
				numbers.each_with_index do |number, index|
					print "#{index}\t" if (22..24).include? index or (0..8).include? index
				end
				puts
			end
			
			print "#{pn} \t"
			numbers.each_with_index do |number, index|
				print "#{number}\t" if (22..24).include? index or (0..8).include? index
			end
			puts
		end
end