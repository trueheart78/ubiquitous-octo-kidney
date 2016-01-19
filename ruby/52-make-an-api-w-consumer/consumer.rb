require 'httparty'

class SpaceJam

  def output
    puts 'Gathering data from APIs'
    puts '************************'
    puts 'Currently in Space:'
    real_astronauts.shuffle.each do |astronaut|
      puts "+ #{astronaut['name']} is on the #{astronaut['craft']}"
    end
    puts '========================'
    puts 'Scheduled for Space travel:'
    fake_astronauts.shuffle.each do |astronaut|
      puts "- #{astronaut['name']}"
    end
    puts '************************'
    puts 'Next in line:'
    puts "= #{next_astronaut['name']}"
    puts '************************'
  end

  private

  def next_astronaut
    fake_astronauts.sample
  end

  def real_astronauts
    return @real_astronauts if @real_astronauts
    url = 'http://api.open-notify.org/astros.json'
    response = HTTParty.get url
    @real_astronauts = response.parsed_response['people']
  end

  def fake_astronauts
    return @fake_astronauts if @fake_astronauts
    url = 'http://spacequeue.th78.me/astronauts.json'
    response = HTTParty.get url
    @fake_astronauts = response.parsed_response
  end
end

SpaceJam.new.output
