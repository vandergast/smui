=begin
Author: Vandergast
Description: A small user interface for console apps

=end

require 'json'
# require 'YOUR APP CONNECTOR'

class Menu
  def initialize
    dp "Building menu"
    menu = load_json
    @app_name = menu["app_name"] # The name of the app
    @description = menu["description"] # A description of the app
    @options = menu["options"] # The options available for the user
    @actions = method(:actions).to_proc # A proc that executes the selected option
  end

  def run
    top_range = @options.length + 1
    answer = 0
    loop do
      system ("clear")
      puts "Welcome to " + "#{@app_name}"
      puts "#{@description}".colorize(:light_blue)
      puts ""
      puts "MENU:".colorize(:light_blue)
      @options.each{|option| puts option.light_yellow}       
      puts ">> ".colorize(:light_blue)
      answer = input.to_i
      puts "#{answer}"
      break if answer > 0 && answer < top_range
      ep "That's not an option in the MENU, please chose again.\n\t(press enter)"
    end
    system ("clear")
    @actions.call(answer)
  end

  private
  def actions(choice)
    case choice
      when 1
        #Enter an action to be executed
        puts "Option 1"
      when 2
        #Enter an action to be executed
        puts "Option 2"
      when 3
        #Enter an action to be executed
        puts "Option 3"
      when 4
        #Enter an action to be executed
        puts "Option 4"
      when 5
        false
    end 
  end

  def load_json
    dp "Loading config.json"
    file = File.read('./config.json')
    data = JSON.parse(file)
  end
end