class ComputerCodeBreaker
  def initialize(selected_code)
    @user_selected_code = selected_code
  end

  def search_a_hidden_combination
    @all_colors = ['p','br','o','g','b','y'] 
    @complete_matches =Array.new(4)
   
    12.times do
      @choosing_a_computer = @all_colors.sample(4)
      
      @user_selected_code.each_with_index do |element, index|
        if element == @choosing_a_computer[index] 
          @complete_matches[index] = element 
          if @all_colors.size > 4
            @all_colors.delete(element)
          else
            @all_colors.map! {|x| x == element ? '*' : x}
          end
        else 
          if @choosing_a_computer.include? (element)
            @complete_matches[index] = element 
          end
        end
      end
      print "Your code -                         #{@user_selected_code.join(', ')}\n"
      print "Computer code -                     #{@choosing_a_computer.join(', ')}\n"
      print "A complete match in past attempts - #{@complete_matches.join(', ')}\n\n"
   
      sleep(1)

      if  @user_selected_code == @complete_matches
        puts 'The computer winded'
        break
      end

    end
    puts 'The computer lost the game this time.' if  @user_selected_code != @complete_matches
  end 
end

q = ComputerCodeBreaker.new(['br','o','g','b'])
q.search_a_hidden_combination

 