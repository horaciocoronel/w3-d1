class Zombie
  @@horde = []
  #This value will increase over time.
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3

  #Instance Methods
  def initialize(speed, strength)
    @@strength = strength
    @@speed = speed
    if speed > @@max_speed
      speed = @@default_speed
    end
    if strength <= @@max_strength
      return strength
    else
      strength = @@default_strength
    end
  end
  def encounter
    # 1. escaping unscathed
    # 2. being killed by the zombie
    # 3. catching the plague and becoming a zombie yourself.
    if outrun_zombie? == true || survive_attack? == true
      puts "You've escaped the Zombies!"
    elsif survive_attack? == false
      puts "You died during the attack"
    elsif outrun_zombie? == false
      next_speed = rand(@@max_speed)
      next_strength = rand(@@max_strength)
      @@horde << Zombie.new(next_speed, next_strength)
      puts "You became a Zombie yourself!"
    end
  end
  def outrun_zombie?
    if @@speed > rand(@@max_speed)
      return true
    else
      return false
    end
  end
  def survive_attack?
    if @@strength > rand(@@max_strength)
      return true
    else
      return false
    end
  end
  #Class Methods
  def self.all
    return @@horde
  end
  def self.spawn
    zombies = rand(@@plague_level)
    zombies.times do
      next_speed = rand(@@max_speed)
      next_strength = rand(@@max_strength)
      @@horde << Zombie.new(next_speed, next_strength)
    end
  end
  def self.new_day
    self.some_die_off
    self.spawn
    self.incrase_plague_level
  end
  def self.incrase_plague_level
    @@plague_level + rand(2)
  end
  def self.some_die_off
    rand(11).times do @@horde.delete_at(0)
    end
  end

end #Class ends
puts Zombie.all.inspect # []
Zombie.new_day
# puts Zombie.all.inspect # [#<Zombie:0x005626ecc5ebd0 @speed=4, @strength=0>, #<Zombie:0x005626ecc5eba8 @speed=0, @strength=4>, #<Zombie:0x005626ecc5eb80 @speed=4, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You are now a zombie
puts zombie2.encounter # You died
puts zombie3.encounter # You died
Zombie.new_day
# puts Zombie.all.inspect # [#<Zombie:0x005626ecc5e1f8 @speed=0, @strength=0>, #<Zombie:0x005626ecc5e180 @speed=3, @strength=3>, #<Zombie:0x005626ecc5e158 @speed=1, @strength=2>, #<Zombie:0x005626ecc5e090 @speed=0, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You got away
puts zombie2.encounter # You are now a zombie
puts zombie3.encounter # You died
