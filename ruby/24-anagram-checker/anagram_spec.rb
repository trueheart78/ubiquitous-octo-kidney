require 'rspec'
require_relative 'anagram'

RSpec.describe Anagram do

  describe "#valid?" do

    it "is valid when words are anagrams" do
      anagram = Anagram.new
      anagram.words = [ "tone", "note" ]

      expect(anagram).to be_valid
    end

    it "is not valid when words are not anagrams" do
      anagram = Anagram.new
      anagram.words = [ "boat", "tuba" ]

      expect(anagram).to_not be_valid
    end

    it "works with 3 or more words" do
      anagram = Anagram.new
      anagram.words = [ "tone", "note", "e-ton" ]

      expect(anagram).to be_valid
    end

    it "works with sentences" do
      anagram = Anagram.new
      anagram.words = [ "a decimal point", "I'm a dot in place" ]

      expect(anagram).to be_valid
    end
  end

end
