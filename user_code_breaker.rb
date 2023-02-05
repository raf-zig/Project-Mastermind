class UserCodeBreaker
  def initialize(selected_code)
    @selected_code = selected_code
  end

  def search_for_a_hidden_combination
      @guessed_colors = []
      @complete_matches = []

    12.times do
      puts 'Enter a possible combination in the format "o g y b"'
      @user_option = gets.strip.split

      @selected_code.each_with_index do |element, index| 
        if @user_option.include? element
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
      puts "Number of guessed colors - #{@guessed_colors.length}"
      puts "Number of complete matches - #{@complete_matches.length}"
      @guessed_colors = []
      @complete_matches = []
    end 
    puts "The user lost the game this time. The hidden combination - #{@selected_code.join (' ')}" if @complete_matches.length != 4
  end
end

q = UserCodeBreaker.new(['br','o','g','b'])
q.search_for_a_hidden_combination