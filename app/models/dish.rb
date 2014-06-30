class Dish < ActiveRecord::Base
  
  # == Accesors
  attr_accessible :description, :price, :name, :category_id

  # == Validations
  validates_presence_of :name, :price

  # == Callbacks
  before_save :capitalize_name

  # == Associations
  has_one :category
  has_many :sales

  private

    def capitalize_name
      self.name.capitalize!
    end

end
