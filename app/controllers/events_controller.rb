class EventsController < ApplicationController
  
  def index
    @sport_title = Genre.find_by({category: "Sport"})
    @sport = Genre.where("category like ?", "Sport")

    @music_title = Genre.find_by({category: "Music"})
    @music = Genre.where("category like ?", "Music")

    @comedy_title = Genre.find_by({category: "Comedy"})
    @comedy = Genre.where("category like ?", "Comedy")

    @theatre_title = Genre.find_by({category: "Theatre & The Arts"})
    @theatre = Genre.where("category like ?", "Theatre & The Arts")
    # binding.pry

    @events = Event.all
  end

end
