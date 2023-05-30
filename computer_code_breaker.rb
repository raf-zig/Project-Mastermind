# frozen_string_literal: true

# A computer guesses a cipher created by a user.
class ComputerCodeBreaker
  def initialize(cipher_selected_by_a_user)
    @user_selected_code = cipher_selected_by_a_user
  end

  def search_a_hidden_combination
    @all_colors = %w[r w o g b y]
    @complete_matches = Array.new(4)
    print "Your code -                         #{@user_selected_code.join(', ')}\n\n"

    12.times do
      @choosing_a_computer = @all_colors.sample(4)

      @guessed_colors_to_display = []
      @matching_positions_to_display = []

      @user_selected_code.each_with_index do |element, index|
        if element == @choosing_a_computer[index]
          @complete_matches[index] = element
          @matching_positions_to_display << element
          if @all_colors.size > 4
            @all_colors.delete(element)
          else
            @all_colors.map! { |x| x == element ? '*' : x }
          end
        elsif @choosing_a_computer.include? element
          @guessed_colors_to_display << element
        end
      end
      print "Computer code -                     #{@choosing_a_computer.join(', ')}\n"
      print 'coincidences -'
      print "                       #{(@matching_positions_to_display.collect { '◉' }).join('')}".red
      print " #{(@guessed_colors_to_display.map { '◉' }).join('')}\n".white
      sleep(1)

      next unless @user_selected_code == @complete_matches

      puts 'The computer winded'
      print "The final version of the computer - #{@complete_matches.join(', ')}\n\n"
      break
    end
    return unless @user_selected_code != @complete_matches

    puts "The computer lost with the version -  #{@complete_matches.join(', ')}"
  end
end
