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
  @@guessed_combinations2 = []

  @@choosing_a_computer = ['p','br','o','g','b','y'].sample(4)
    
  def search_for_a_hidden_combination
    @selected_code.each_with_index do |element, index|
      if @@choosing_a_computer.include? (element)
        @@guessed_combinations[index] = element
      end
      if element == @@choosing_a_computer[index] #and @selected_code.index(element) == @@choosing_a_computer.index(@@choosing_a_computer[index])
        @@guessed_combinations2[index] = element 
      end
    end
  end   
   
  def debugging
    print "#{@selected_code}\n"
    puts "#{@@choosing_a_computer}\n"
    puts "#{@@guessed_combinations}\n"
    puts "#{@@guessed_combinations2}\n"
    puts @@guessed_combinations.size
  end
  
end
q = CodeBreaker.new(['br','o','g','b'])
q.search_for_a_hidden_combination
puts q.debugging
