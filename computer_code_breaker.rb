class ComputerCodeBreaker
  def initialize(selected_code)
    @selected_code = selected_code
  end

  def search_a_hidden_combination
    @all_colors = ['p','br','o','g','b','y'] 
    @number_of_guessed_colors  = []
    @number_of_complete_matches = []

    12.times do
      @choosing_a_computer = @all_colors.sample(4)
      @selected_code.each_with_index do |element, index|
        if @choosing_a_computer.include? (element)
          @number_of_guessed_colors[index] = element
        end
        if element == @choosing_a_computer[index] 
          @number_of_complete_matches[index] = element 
          if @all_colors.size > 4
            @all_colors.delete(element)
          else
            @all_colors.map! {|x| x == element ? '*' : element}
          end
        end
      end
      print "#{@selected_code}\n"
      print "#{@choosing_a_computer}\n"
      print "#{@number_of_complete_matches}\n"
    end
  end 
end

q = ComputerCodeBreaker.new(['br','o','g','b'])
q.search_a_hidden_combination

 