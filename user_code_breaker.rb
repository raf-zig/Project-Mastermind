class UserCodeBreaker
  def initialize(selected_code)
    @selected_code = selected_code
  end

  def search_for_a_hidden_combination
      @number_of_guessed_colors = []
      @number_of_complete_matches = []

    12.times do
      puts 'Enter a possible combination in the format "o g y b"'
      @user_option = gets.strip.split

      @selected_code.each_with_index do |element, index| 
        if @user_option.include? (element)
          @number_of_guessed_colors << element
        end

        if element == @user_option[index] 
          @number_of_complete_matches << element
          if @number_of_complete_matches.length == 4
            puts 'The user wined'
          end
        end
      end
      break if @number_of_complete_matches.length == 4
      puts "Number of guessed colors - #{@number_of_guessed_colors.length}"
      puts "Number of complete matches - #{@number_of_complete_matches.length}"
      @number_of_guessed_colors = []
      @number_of_complete_matches = []
    end 
    puts "The user lost the game this time. The hidden combination - #{@selected_code}" if @number_of_complete_matches.length != 4
  end
end

q = UserCodeBreaker.new(['br','o','g','b'])
q.search_for_a_hidden_combination