require 'pry'
require_relative './model/word'

class Shuffle

  def self.get(type, done)
    begin
      obj_word = Word.new({type: type}).get_data
      obj_word = obj_word - done
      word = obj_word.sample
      { answer: word, clue: word.chars.shuffle.join }
    rescue => exception
      {}
    end
  end

end
