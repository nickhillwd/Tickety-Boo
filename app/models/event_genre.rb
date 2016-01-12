class EventGenre < ActiveRecord::Base

  belongs_to :event
  belongs_to :genre

end
