class TransfersTag < ActiveRecord::Base
  attr_accessible :tag_id, :transfer_id
  belongs_to :tag
  belongs_to :transfer
end
