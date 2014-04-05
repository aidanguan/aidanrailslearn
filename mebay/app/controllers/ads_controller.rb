class AdsController < ApplicationController
  def show
    @ad = Ad.find(params[:id])
  end
end

def index
  @ads = Ad.find(:all)
end
