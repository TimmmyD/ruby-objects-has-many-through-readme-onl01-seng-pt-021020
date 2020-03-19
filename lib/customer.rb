class Customer
  attr_accessor :name, :age 
  
  @@all = []
  
  def initialize(name, age)
    @name = name 
    @age = age 
    @@all << self 
  end
  
  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end 

 def meals
   Meal.all.select do |meal|
     meal.customer == self
   end 
 end 
 
 def waiters
   meals.map do |meal|
     meal.waiter 
   end 
 end 
  
 def self.all
    @@all
  end 
  
end 


  sam = Customer.new("Sam", 27)
  pat = Waiter.new("Pat", 2)
  alex = Waiter.new("Alex", 5)
  
  sam.new_meal(pat, 50, 10)
  sam.new_meal(alex, 20, 3)
  pat.new_meal(sam, 30, 5)
  
  terrance = Customer.new("Terrance", 27)
  jason = Waiter.new("Jason", 4)
  andrew = Waiter.new("Andrew", 7)
  yomi = Waiter.new("Yomi", 10)
  
  terrance.new_meal("Jason", 50, 6)
  terrance.new_meal(andrew, 60, 8)
  terrance.new_meal(yomi, 30, 4)
  
  terrance.waiters
  
  terrance.waiters.length 
  
  terrance.waiters.last.name
  