class Category < ActiveRecord::Base

  # == Accesors
  attr_accessible :name

  # == Validations
  validates_presence_of :name
  validates_uniqueness_of :name

  # == Callbacks
  before_save :capitalize_name

  private

    def capitalize_name
      self.name.capitalize!
    end

end
