require "smui/version"
require 'json'
require_relative 'printers'
require 'menu'

module Smui

	def configuration(name="", description="", options=[])
		config = {
			app_name: name,
			description: description,
			options: options
		}
		File.new("#{Dir.pwd}/config.json", "w+")
		File.open("#{Dir.pwd}/config.json", 'w') do |file|
    	file.puts config.to_json
    end
	end

	def menu
		menu = Menu.new
	  menu.run
	end
end
