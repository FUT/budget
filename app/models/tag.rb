class Tag < ActiveRecord::Base
  attr_accessible :color, :name

  has_many :transfers_tags
  has_many :transfers, through: :transfers_tags
end
