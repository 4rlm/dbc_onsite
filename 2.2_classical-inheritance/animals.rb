module SuperPowers
  def self.use_laser_vision
    "I can battle evil with my laser vision!"
  end

  def self.magic_points
    "I can help the weak with my magic points!"
  end

  def self.magic_weather
    "I can change the weather according to your wish!"
  end

end

class Animal
  attr_reader :name, :species, :num_legs, :warm_blooded, :nocturnal, :consumption_type, :locomotion_mode

  def initialize(args = {})
    @name = args.fetch(:name) { false }
    @species = args.fetch(:species) { false }
    @num_legs = args.fetch(:num_legs) { false }
    @warm_blooded = args.fetch(:warm_blooded) { false }
    @nocturnal = args.fetch(:nocturnal) { false }
    @consumption_type = args.fetch(:consumption_type) { false }
    @locomotion_mode = args.fetch(:locomotion_mode) { false }
  end

  def intro
    "\n\nHello!  Please allow me to introduce myself..."
  end

  def about_me
    if @nocturnal
      @nocturnal = "I sleep all day, and play all night"
    else
      @nocturnal = "I sleep all night, and work all day"
    end

    "My name is #{@name} and I have #{@num_legs} legs and I can #{@locomotion_mode}.  #{@nocturnal}, and I'm also a #{@consumption_type}.\n"

  end

  def who_am_i?
    "Can you guess who I am?\n"
  end

end

#######################
class Mammal < Animal
end

class Amphibian < Animal
end

#######################
class Primate < Mammal
end

class Therapsid < Mammal
end

class Anura < Amphibian
end

#######################
class Frog < Anura
  def speak
    "I say, Ribbit-Ribbit"
  end

  def super_powers
    power = SuperPowers
    "And, I have a super-power ...#{power.use_laser_vision}"
  end

end

class Bat < Therapsid
  def speak
    "I say, eek-eek"
  end

  def super_powers
    power = SuperPowers
    "And, I have a super-power ...#{power.magic_weather}"
  end
end

class Chimpanzee < Primate
  def speak
    "I say, ooh-ooh, ahh-ahh\n"
  end

  def super_powers
    power = SuperPowers
    "And, I have a super-power ...#{power.magic_points}"
  end
end

############# Runner ###################
frog_details = {
  name: 'Frankie',
  species: 'frog',
  num_legs: 4,
  warm_blooded: true,
  nocturnal: false,
  consumption_type: 'carnivore',
  locomotion_mode: 'jump'
}

bat_details = {
  name: 'Barry',
  species: 'bat',
  num_legs: 2,
  warm_blooded: true,
  nocturnal: true,
  consumption_type: 'carnivore',
  locomotion_mode: 'fly'
}

chimpanzee_details = {
  name: 'Charlie',
  species: 'chimpanzee',
  num_legs: 4,
  warm_blooded: true,
  nocturnal: false,
  consumption_type: 'omnivore',
  locomotion_mode: 'climb'
}

####################################
frankie = Frog.new(frog_details)
# puts frankie.inspect
puts frankie.intro
puts frankie.about_me
puts frankie.speak
puts frankie.super_powers
puts frankie.who_am_i?
# #########
barry = Bat.new(bat_details)
# puts barry.inspect
puts barry.intro
puts barry.about_me
puts barry.speak
puts barry.super_powers
puts barry.who_am_i?
# #########
charlie = Chimpanzee.new(chimpanzee_details)
# puts charlie.inspect
puts charlie.intro
puts charlie.about_me
puts charlie.speak
puts charlie.super_powers
puts charlie.who_am_i?
