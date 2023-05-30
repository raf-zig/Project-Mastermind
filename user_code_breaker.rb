# frozen_string_literal: true

# A user guesses a cipher created by a computer.
class UserCodeBreaker
  def initialize(cipher_selected_by_a_computer)
    @selected_code = cipher_selected_by_a_computer
  end

  def search_a_hidden_combination
    @guessed_colors = []
    @complete_matches = []

    print "Computer code -                             ⭕⭕⭕⭕\n\n"
    puts 'Enter a possible combination in the format "o g y b"'

    12.times do
      @user_option = gets.strip.split
      @selected_code.each_with_index do |element, index|
        @guessed_colors << element if @user_option.include?(element) && (element != @user_option[index])

        next unless element == @user_option[index]

        @complete_matches << element
        puts 'The user wined' if @complete_matches.length == 4
      end

      break if @complete_matches.length == 4

      print 'coincidences -'
      print "                              #{(@complete_matches.collect { |_i| '◉' }).join('')}".red
      print " #{(@guessed_colors.collect { |_i| '◉' }).join('')}\n".white
      @guessed_colors = []
      @complete_matches = []
    end
    return unless @complete_matches.length != 4

    puts "The user lost the game this time.\nThe hidden combination -                    #{@selected_code.join(' ')}"
  end
end
