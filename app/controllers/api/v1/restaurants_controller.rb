class Api::V1::RestaurantsController < ApplicationController
  # before_action :authenticate_user!
  respond_to :json
  def index
    render :staus => 200, :json => {:status => "Success",:data => Restaurant.get_data}
  end
end
