class Dish < ActiveRecord::Base
  
  # == Accesors
  attr_accessible :description, :price, :name

  # == Validations
  validates_presence_of :name, :price

end
