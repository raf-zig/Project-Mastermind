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
  
  @@all_colors = ['p','br','o','g','b','y']
  
  @@guessed_combinations = []
  @@guessed_combinations2 = []

  def search_for_a_hidden_combination
    12.times do
      @choosing_a_computer = @@all_colors.sample(4)
      @selected_code.each_with_index do |element, index|
        if @choosing_a_computer.include? (element)
          @@guessed_combinations[index] = element
        end
        if element == @choosing_a_computer[index] 
          @@guessed_combinations2[index] = element 
          if @@all_colors.size > 4
            @@all_colors.delete(element)
          else
            @@all_colors.map! {|x| x == element ? '*' : element}
          end
        
        end
      end
      print "#{@selected_code}\n"
      print "#{@choosing_a_computer}\n"
      print "#{@@guessed_combinations2}\n"
    end
  end 
  
  def debugging
    print "#{@selected_code}\n"
    puts "#{@@choosing_a_computer}\n"
    puts "#{@@guessed_combinations}\n"
    puts "#{@@guessed_combinations2}\n"
    puts "#{@@all_colors}\n"
    puts @@guessed_combinations.size
  end
  
end

q = CodeBreaker.new(['br','o','g','b'])
q.search_for_a_hidden_combination
 # puts q.debugging
 