require 'pry'

module Killable
  def alive?
    self.health > 0
  end

  def dead?
    not self.alive?
  end
end

class StuffedAnimals
  attr_reader :name
  attr_accessor :health, :level
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

class StuffedReptiles
  attr_reader :level, :name
  attr_accessor :health

  include Killable

  def initialize(level)
    @level = level
    @name = "Enemy (#{level})"
    @health = 0
    level.times { @health += rand(1..4) }
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

class Bear < StuffedAnimals
  def initialize(name, weapon, level=1)
    @weapon = "plastic_sword"
    @damage_per_level = 4
    @health_per_level = 20
    super(name, level)
  end

  def teddy_terror(other)
    puts "Beating #{other} senseless with it's Plastic Sword of AWESOMENESS!"
    num_attacks = (@level / 3) + 1
    num_attacks.times { self.attack(other) }
    other.attack(self)
  end
end

class Bunny < StuffedAnimals
  def initialize(name, weapon, level=1)
    @weapon = "slingshot"
    @damage_per_level = 3
    @health_per_level = 15
    super(name, level)
  end

  def rabbit_rain(other)
    puts "Shooting #{{other}}s right betwixt the eye sockets!"
    num_attacks = (@level / 3) + 1
    num_attacks.times { self.attack(other) }
    other.attack(self)
  end
end

class Puppy < StuffedAnimals
  def initialize(name, weapon, level=1)
    @weapon = "staff"
    @damage_per_level = 5
    @health_per_level = 10
    super(name, level)
  end

  def healing_howl(chars, other)
    chars.each do |x|
    puts "Healing #{x}!"
    healing = (x.health / 10) + 5
    x.health += healing
    other.attack(self)
  end
end

class Gopher < StuffedAnimal
  def initialize(name, weapon, level=1)
    @weapon = "firecrackers"
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


binding.pry