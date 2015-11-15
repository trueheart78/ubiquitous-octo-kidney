require_relative 'password'

RSpec.describe Password do

  describe "#check_strength" do

    it "is less than 8 characters" do
      password = Password.new("abc123")
      expect(password.check_strength).to eq(:weak)
    end

    it "is only numbers" do
      password = Password.new("1234567890123456")
      expect(password.check_strength).to eq(:weak)
    end

    it "is only letters" do
      password = Password.new("abcdefghijklmnop")
      expect(password.check_strength).to eq(:weak)
    end

    it "is letters and numbers to 8 characters" do
      password = Password.new("abcd1234")
      expect(password.check_strength).to eq(:strong)
    end
  end

end
