class Anagram
  attr_accessor :words

  def valid?
    return false unless words.length > 1

    same_length? && same_characters?
  end

  private

  def same_length?
    words.all? { |w| clean_word(w).length == clean_word(words.first).length }
  end

  def same_characters?
    chars = clean_word(words.shift).split(//)

    words.all? { |w| chars.all? { |c| clean_word(w).include? c } }
  end

  def clean_word(word)
    word.gsub(' ','').gsub('-','').gsub('\'','').downcase
  end
end
