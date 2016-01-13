class ActsController < ApplicationController
  def index
  end

  def show
    @act = Act.find(params[:id])    
  end

  def all_events
    @act = Act.find(params[:id])
  end

  def edit
    @act = Act.find(params[:id])
  end

  def update
    act = Act.find(params[:id])
    act.update(act_params)
    redirect_to admin_index_path
  end

  private

    def act_params
      params.require(:act).permit(:act_name, :act_details, :act_image)
    end

end
