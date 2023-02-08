class ComputerCodeBreaker
  def initialize(selected_code)
    @user_selected_code = selected_code
  end

  def search_a_hidden_combination
    @all_colors = %w[r w o g b y]
    @complete_matches = Array.new(4)
    print "Your code -                         #{@user_selected_code.join(', ')}\n\n"
    12.times do
      @choosing_a_computer = @all_colors.sample(4)
      @guessed_colors = []
      @matching_positions = []
      @user_selected_code.each_with_index do |element, index|
        if element == @choosing_a_computer[index] 
          @complete_matches[index] = element
          @matching_positions << element
          if @all_colors.size > 4
            @all_colors.delete(element)
          else
            @all_colors.map! {|x| x == element ? '*' : x}
          end
        else 
          if @choosing_a_computer.include? element  
            @guessed_colors << element
          end
        end
      end
      
      print "Computer code -                     #{@choosing_a_computer.join(', ')}\n"
      print 'coincidences -'
      print "                       #{(@matching_positions.collect{ |i| '⚫' }).join('')}".red
      print " #{(@guessed_colors.collect{ |i| '⚫' }).join('')}\n".white
      sleep(1)

      if @user_selected_code == @complete_matches
        puts 'The computer winded'
        print "The final version of the computer - #{@complete_matches.join(', ')}\n\n"
        break
      end
    end
    puts 'The computer lost the game this time.' if @user_selected_code != @complete_matches
  end 
end



 
