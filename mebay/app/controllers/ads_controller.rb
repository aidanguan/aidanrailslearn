class AdsController < ApplicationController
  before_filter :check_logged_in, :only=>[:edit, :update, :destroy]
  def new
    @ad = Ad.new
  end

  def create
    @ad =Ad.new(ad_params)
    if @ad.save
      #@ad.valid?

      redirect_to ads_path
    else
      render 'new'
    end
    #如果输入错了，ad.save保存失败，就没法返回,ad_path(@ad)，注意，如果返回index就用ads_path因为index是一个多条的，所以用复数

    #redirect_to "/ads/#{@ad.id}"
  end

  def edit
    @ad = Ad.find(params[:id])
  end

  def update
    @ad = Ad.find(params[:id])
    @ad.attributes = ad_params
    if @ad.save
      redirect_to ads_path
    else
      render 'edit'
    end
  end



  def show
    @ad = Ad.find(params[:id])
  end


  def index
    @ads = Ad.find(:all)
  end

  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy
    redirect_to "/ads/"
  end

  def find
    puts params[:search_string]
    @ads = Ad.where ({:name=>params[:search_string]})
    #下面这句find过时了，在新版本用where
    #@ads = Ad.find_all_by_name(params[:search_string])
    #render 'index'
  end





  private
    def check_logged_in
      authenticate_or_request_with_http_basic("Ads") do |username, password|
        username == "admin" && password == "Sh123456"
      end
    end


    def ad_params
      params.require(:ad).permit(:name, :description, :price, :seller_id, :email, :img_url)
    end

end

