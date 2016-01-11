class ActsController < ApplicationController
  def index
  end

  def show
    @act = Act.find(params[:id])    
  end
end
