class Transfer < ActiveRecord::Base
  attr_accessible :amount, :description, :title, :user_id, :tag_ids, :total
  attr_accessor :total

  has_many :transfers_tags
  has_many :tags, through: :transfers_tags
  belongs_to :user

  def self.with_total
    previous = Transfer.new total: 0
    scoped.each do |transfer|
      transfer.total = previous.total + transfer.amount
      previous = transfer
    end
  end
end
