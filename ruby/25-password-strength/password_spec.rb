require_relative 'password'

RSpec.describe Password do

  describe "password strength" do

    it "is less than 8 characters" do
      password = Password.new("abc123")
      expect(password).to be_weak
    end

    it "is only numbers" do
      password = Password.new("1234567890123456")
      expect(password).to be_weak
    end

    it "is only letters" do
      password = Password.new("abcdefghijklmnop")
      expect(password).to be_weak
    end

    it "is letters and numbers to 8 characters" do
      password = Password.new("abcd1234")
      expect(password).to be_strong
    end

    it "is letters and numbers with symbols" do
      password = Password.new("abc&123.")
      expect(password).to be_very_strong
    end
  end

end
