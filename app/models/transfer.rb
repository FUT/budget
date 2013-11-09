class Transfer < ActiveRecord::Base
  attr_accessible :amount, :description, :title, :user_id

  has_many :transfers_tags
  has_many :tags, through: :transfers_tags
  belongs_to :user
end
