class UserCodeBreaker
  def initialize(selected_code)
    @selected_code = selected_code
  end

  def search_for_a_hidden_combination
    puts 'Enter a possible combination in the format "o g y b"'
    @user_option = gets.strip.split
  end

  @@number_of_guessed_colors = []
  @@number_of_complete_matches = []

  @selected_code.each_with_index do |element, index| do
    if @user_option.include? (element)
      @@number_of_guessed_colors << element
      puts "Number of guessed colors - #{@@number_of_guessed_colors.length}"
    end
  end
end