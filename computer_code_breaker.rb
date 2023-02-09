#A computer guesses a cipher created by a user.
class ComputerCodeBreaker
  def initialize(cipher_selected_by_a_user)
    @user_selected_code = cipher_selected_by_a_user
  end

  def search_a_hidden_combination
    @all_colors = %w[r w o g b y]
    @complete_matches = Array.new(4)
    print "Your code -                         #{@user_selected_code.join(', ')}\n\n"
    #The array is created in the Array.new(4) format in order to know the indexes of the guessed colors in the wrong positions.
    @guessed_colors = Array.new(4)
    12.times do
      @choosing_a_computer = @all_colors.sample(4)
      #In subsequent iterations, if the guessed colors match in the wrong positions with the computer variant, the variant is changed by the 'reverse!' method.
      @choosing_a_computer.each_with_index do |element, index|
        if element == @guessed_colors[index]
          @choosing_a_computer.reverse!
        end
      end
      
      #The array is reset to zero for a new search.
      @guessed_colors = Array.new(4)
      #Another array of guessed colors to display.
      @guessed_colors_to_display = []
      @matching_positions = []
      @user_selected_code.each_with_index do |element, index|
        if element == @choosing_a_computer[index] 
          @complete_matches[index] = element
          @matching_positions << element
          #The guessed color is removed from the search
          if @all_colors.size > 4
            @all_colors.delete(element)
          else
          #or replaced with a "*" sign to keep the number of items selected by the computer.
            @all_colors.map! {|x| x == element ? '*' : x}
          end
        else 
          #Guessed colors in wrong positions.
          if @choosing_a_computer.include? element  
            @guessed_colors << element
            @guessed_colors_to_display << element
          end
        end
      end
      
      print "Computer code -                     #{@choosing_a_computer.join(', ')}\n"
      print 'coincidences -'
      print "                       #{(@matching_positions.collect{ |i| '◉' }).join('')}".red
      print " #{(@guessed_colors_to_display.map{ |i| '◉' }).join('')}\n".white
      sleep(1)

      if @user_selected_code == @complete_matches
        puts 'The computer winded'
        print "The final version of the computer - #{@complete_matches.join(', ')}\n\n"
        break
      end
    end
    puts "The computer lost the game this time."
    puts "The final version of the computer -   #{@complete_matches.join(', ')}" if @user_selected_code != @complete_matches
  end 
end



 
