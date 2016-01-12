class EventsController < ApplicationController
  
  def index
    # @genres = Genre.all

    @sport_title = Genre.find_by({category: "Sport"})
    @sport = Genre.where({category: "Sport"}).first(4)

    @music_title = Genre.find_by({category: "Music"})
    @music = Genre.where("category like ?", "Music")

    @comedy_title = Genre.find_by({category: "Comedy"})
    @comedy = Genre.where("category like ?", "Comedy")

    @theatre_title = Genre.find_by({category: "Theatre & The Arts"})
    @theatre = Genre.where("category like ?", "Theatre & The Arts")
    # binding.pry
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    #binding.pry
  end

end
