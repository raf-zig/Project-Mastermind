class CodeMaker
  all_colors = ['p','br','o','g','b','y']
  @computer_selected_colors = all_colors.sample(4) 

  def user_selected_colors
    puts 'Choose a color combination in the format "o g y b"'
    @user_selection = gets.strip.split
  end
end


class CodeBreaker
  def initialize(selected_code)
    @selected_code = selected_code
  end
  
  @@guessed_combinations = []

  @@choosing_a_computer = ['p','br','o','g','b','y'].sample(4)
    
  def search_for_a_hidden_combination
    @selected_code.each_with_index do |element, index|
      if @@choosing_a_computer.include? (element)
        @@guessed_combinations[index] = element
      end
    end
  end   
   
  def debugging
    puts @selected_code
    puts @@choosing_a_computer
    puts @@guessed_combinations
    puts @@guessed_combinations.size
  end
  
end
q = CodeBreaker.new(['br','o','g','b'])
q.search_for_a_hidden_combination
puts q.debugging
