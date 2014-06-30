class Sale < ActiveRecord::Base

  # == Accesors
  attr_accessible :amount, :date, :dishes_token

  attr_reader :dishes_token

  # == Associations
  has_many :dishes

  def dishes_tokens=(ids)
    self.dish_id = ids
  end
  
end
