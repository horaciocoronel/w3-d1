class Vampire
  @@coven = []
  def initialize(name, age, in_coffin, drank_blood)
    @name = name
    @age = age
    @in_coffin = in_coffin
    @drank_blood_today = drank_blood
  end
  def create(name, age, in_coffin, drank_blood)
    @@coven << Vampire.new(name, age, in_coffin, drank_blood)
  end
  def drink_blood
    @drank_blood = true
  end
  def sunrise
    #removes from the coven any vampires who are out of their coffins or who haven't drank any blood in the last day
    if @in_coffin == false || @drank_blood_today == false
      @@coven.delete[0]
    end
  end
  def sunset
    @drank_blood_today = false
    @in_coffin = false
  end
  def go_home
    in_coffin = true
  end
end
