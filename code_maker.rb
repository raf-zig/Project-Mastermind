# frozen_string_literal: true

# A computer or user selects the colors for a cipher("r"-red, "w"-white, "o"-orange, "g"-green, "b"-blue, "y"-yellow).
class CodeMaker
  def computer_selected_colors
    @computer_selected_colors = %w[r w o g b y].sample(4)
  end

  def user_selected_colors
    puts 'Choose a color combination in the format "o g y b"'
    @user_selection = gets.strip.split
  end
end
