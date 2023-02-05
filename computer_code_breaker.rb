class ComputerCodeBreaker
  def initialize(selected_code)
    @selected_code = selected_code
  end

  def search_a_hidden_combination
    @all_colors = ['p','br','o','g','b','y'] 
    @guessed_colors  = []
    @complete_matches =Array.new(4)

    12.times do
      @choosing_a_computer = @all_colors.sample(4)

      @selected_code.each_with_index do |element, index|
        if @choosing_a_computer.include? (element)
          @guessed_colors[index] = element
        end
        if element == @choosing_a_computer[index] 
          @complete_matches[index] = element 
          if @all_colors.size > 4
            @all_colors.delete(element)
          else
           @all_colors.map! {|x| x == element ? '*' : x}
          end
        end
      end
      print "Your code -                         #{@selected_code.join(', ')}\n"
      print "A complete match in past attempts - #{@complete_matches.join(', ')}\n"
      print "Computer code -                     #{@choosing_a_computer.join(', ')}\n\n"
      
      sleep(1)

      if  @selected_code == @complete_matches
        puts 'The computer winded'
        break
      end

    end
    puts 'The computer lost the game this time.' if  @selected_code != @complete_matches
  end 
end

q = ComputerCodeBreaker.new(['br','o','g','b'])
q.search_a_hidden_combination

 