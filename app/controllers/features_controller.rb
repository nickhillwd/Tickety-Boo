class FeaturesController < ApplicationController

  def edit
    @feature = Feature.find(params[:id])
  end

  def update
    feature = feature.find(params[:id])
    feature.update(feature_params)
    redirect_to admin_index
  end

  private

  def feature_params
    params.require(:feature).permit(:event_id)
  end

end