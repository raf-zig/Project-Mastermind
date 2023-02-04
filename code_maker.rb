class CodeMaker
  def computer_selected_colors
    puts @computer_selected_colors = ['p','br','o','g','b','y'].sample(4) 
  end
  
  def user_selected_colors
    puts 'Choose a color combination in the format "o g y b"'
    @user_selection = gets.strip.split
  end
end

w = CodeMaker.new
puts w.computer_selected_colors