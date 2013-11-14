class Review < ActiveRecord::Base
	belongs_to :product
	belongs_to :user
	scope :newest_first, -> { order("created_at DESC")}
	scope :most_recent_five, -> { newest_first.limit(5)}
end
