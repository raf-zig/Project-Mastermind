class UserCodeBreaker
  def initialize(selected_code)
    @selected_code = selected_code
  end

  def search_for_a_hidden_combination
    puts 'Enter a possible combination in the format "o g y b"'
    @user option = gets.strip.split
  end
end