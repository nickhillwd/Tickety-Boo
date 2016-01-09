class Genre < ActiveRecord::Base

  belongs_to :event
  has_many :acts, :through => :event
  has_many :venues, :through => :event
end
