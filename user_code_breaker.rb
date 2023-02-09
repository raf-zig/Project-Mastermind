#A user guesses a cipher created by a computer.
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
        if @user_option.include? element and element != @user_option[index] 
          @guessed_colors << element
        end

        if element == @user_option[index] 
          @complete_matches << element
          if @complete_matches.length == 4
            puts 'The user wined'
          end
        end
      end
      
      break if @complete_matches.length == 4
      print 'coincidences -'
      print "                              #{(@complete_matches.collect{|i| '▲'}).join('')}".red
      print " #{(@guessed_colors.collect{|i| '◉'}).join('')}\n".white
      @guessed_colors = []
      @complete_matches = []
    end 
    puts "The user lost the game this time.\nThe hidden combination -                    #{@selected_code.join(' ')}" if @complete_matches.length != 4
  end
end
  



