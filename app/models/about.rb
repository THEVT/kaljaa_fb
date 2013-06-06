class About < ActiveRecord::Base
  attr_accessible :content

	belongs_to :profile

	validates :profile_id, presence: true

end
