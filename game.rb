class CodeMaker
  all_colors = ['p','br','o','g','b','y']
  @computer_selected_colors = all_colors.sample(4) 

  def user_selected_colors
    puts 'Choose a color combination in the format "o g y b"'
    @user_selection = gets.strip.split
  end
end


