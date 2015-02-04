require 'pry'

module Killable
  def alive? 
    self.health > 0
  end
  def dead?
   not self.alive?
  end
end


class Wave
  attr_reader :mammal, :reptile, :number

  def initialize(mammal, reptile, number)
    @mammal = mammal
    @reptile = reptile
    @number = number
  end

  def battle
    until @mammal.all.dead?
      @mammal.attack(@reptile)
      @reptile.number.attack(@mammal)
    end
  end
end

class StuffedMammal
  attr_reader :name, :health
  attr_accessor :level
  include Killable

  def initialize(name, level=1)
    @health_per_level ||= 10
    @damage_per_level ||= 2
    @level = level
    @name = name
    @health = level * @health_per_level
  end

  def max_damage
    @level * @damage_per_level
  end

  def damage
    rand(1..max_damage)
  end

  def attack(other)
    damage = self.damage
    other.health -= damage
    if damage > 10
      descriptor = "CRITICALLY HITS!"
    elsif damage > 4
      descriptor = "Pummels!"
    else
      descriptor = "knicks!"
    end
    puts "#{self} #{descriptor} #{other} for #{damage} points of damage."
  end

  def to_s
    @name
  end
end

class StuffedReptile
  attr_reader :level, :name
  attr_accessor :health

  include Killable

  def initialize(level=1, name)
    @health_per_level ||= 7
    @damage_per_level ||= 1
    @level = level
    @name = name
    @health = level * @health_per_level
  end

  def max_damage
    @level * @damage_per_level
  end

  def damage
    rand(1..max_damage)
  end


  def attack(other)
    damage = rand(1..4) * @level
    puts "#{self} viciously assaults #{other} for #{damage} damage."
    other.health -= damage
  end

  def to_s
    @name
  end
end

class Bear < StuffedMammal
 include Killable
  def initialize(name, level=1)
    @weapon = "Plastic Sword"
    @damage_per_level = 4
    @health_per_level = 20
    super(name, level)
  end

  def teddy_terror(other)
    puts "Beating #{other} senseless with it's Plastic Sword of AWESOMENESS!"
    num_attacks = (@level / 4) + 2
    num_attacks.times { self.attack(other) }
    other.attack(self)
  end
end

class Bunny < StuffedMammal
  include Killable
  def initialize(name, level=1)
    @weapon = "Slingshot"
    @damage_per_level = 3
    @health_per_level = 15
    super(name, level)
  end

  def rabbit_rain(other)
    puts "Shooting #{other}s right betwixt the eye sockets!"
    num_attacks = (@level / 3) + 1
    num_attacks.times { self.attack(other) }
    other.attack(self)
  end
end

class Puppy < StuffedMammal
  include Killable
  def initialize(name, level=1)
    @weapon = "Magic Spoon"
    @damage_per_level = 5
    @health_per_level = 10
    super(name, level)
  end

  def healing_howl(chars, other)
    chars.each do |x|
    puts "Healing #{x}!"
    healing = (x.max.health / 5) + 5
    x.health += healing
    other.attack(self)
  end
 end
end 

class Gopher < StuffedMammal
  include Killable
  def initialize(name, level=1)
    @weapon = "Firecrackers"
    @damage_per_level = 8
    @health_per_level = 17
    super(name, level)
  end

  def gopher_grenade(other)
    puts "Annihilated!"
    num_attacks = (@level / 2) + 2
    num_attacks.times { self.attack(other)}
    other.attack(self)
  end
end 

class Viper < StuffedReptile
  include Killable
  def initialize(level=1, name)
    @weapon = ('Axe')
    @damage_per_level = 10
    @health_per_level = 15
    super(name, level)
  end
end

class Gator < StuffedReptile
  include Killable
  def initialize(level=1, name)
    @weapon = ('Rock Candy')
    @damage_per_level = 5
    @health_per_level = 10
    super(name, level)
  end
end

class Iguana < StuffedReptile
  include Killable
  def initialize(name, level=1)
    @weapon = ('Magic Fork')
    @damage_per_level = 10
    @health_per_level = 5
    super(name, level)
  end
end

def heroes
teddy = Bear.new 'Teddy', 20
harry = Bunny.new 'Harry', 20
skippy = Puppy.new 'Skippy', 20
bucky = Gopher.new 'Bucky', 20
end

def villains
  slips = Viper.new 30, 'Slips'
  crocks = Gator.new 'Crocks', 30
  gex = Iguana.new 'Gex', 30
  StuffedReptile.new 25, 'Grunt' 
 
end
def fight(heroes, villains)
  rumble = Wave.new heroes, villains
end

 binding.pry

