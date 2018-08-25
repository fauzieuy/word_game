require_relative 'word_game/shuffle'

class WordGame

  def self.play
    puts "Choose a game :"
    choose_game
  end

  def self.choose_game
    puts "1. Shuffle\n0. Exit\n"
    prompt = "Input the number : "
    print prompt
    while user_input = gets.chomp # loop while getting user input
      case user_input
      when "1"
        get_shuffle
        break
      when "0"
        puts "Thank you"
        break
      else
        puts "Please select either 1"
      end
      print prompt # print the prompt, so the user knows to re-enter input
    end
  end

  def self.get_shuffle
    point = 0
    done = []

    prompt = "1. Next\n2. Finish\nInput the number : "
    print prompt
    while next_or_finish = gets.chomp
      case next_or_finish
      when "1"
        criteria = Shuffle.get('fruits', done)
        if criteria.empty?
          puts "Thank you"
          return nil
        end

        done << criteria[:answer]

        puts "Clue : #{criteria[:clue]}"

        text_answer = "Answer : "
        print text_answer

        while user_input = gets.chomp # loop while getting the right answer
          case user_input
          when criteria[:answer]
            point += 1
            puts "\nGreat!!!"
            puts "Your point is #{point}\n"
            break
          else
            puts "Please try again!"
          end
          print text_answer # print the prompt, so the user knows to re-enter the answer
        end
        puts "\nPlease choose :"
      else
        puts "Thank you."
        break
      end
      print prompt
    end
  end

end
