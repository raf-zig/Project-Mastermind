require_relative 'code_maker.rb'
require_relative 'user_code_breaker.rb'
require_relative 'computer_code_breaker.rb'
require          'colorize'

puts "\n\nWelcome to Mastermind!\n\nRules:\nYou can choose to be a code MAKER or a code BREAKER.Code maker creates
a four color secret combination. The colors can not repeat in the secret combination"
puts 'Code breaker tries to guess the secret combination. You or computer can make up to 12 guesses.After each guess,
 there will be up to four clues.'
print "◉".red
puts '- means there is a correct color in the correct position.'
print "◉".white
puts '- means there is a correct color in a wrong position.'
puts 'Entering "r"  means red, "w" - white, "o" - orange, "g" - green, "b" - blue, "y" - yellow'
puts 'Good luck!'

loop do
  puts "Choose your role: Press 1 for CODE BREAKER, press 2 for CODE CREATOR. If you don't want to play, press any key"
  role = gets.chomp
  code_maker = CodeMaker.new
    if role == '1'
      user_breaker = UserCodeBreaker.new(code_maker.computer_selected_colors)
      user_breaker.search_a_hidden_combination
    elsif role == '2'
      computer_breaker = ComputerCodeBreaker.new(code_maker.user_selected_colors)
      computer_breaker.search_a_hidden_combination
    else
      exit
    end
end


