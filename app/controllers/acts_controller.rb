class ActsController < ApplicationController
  def index
  end

  def show
    @act = Act.find(params[:id])    
  end

  def all_events
    @act = Act.find(params[:id])
  end
end
