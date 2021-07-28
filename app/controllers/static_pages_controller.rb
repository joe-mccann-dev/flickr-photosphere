class StaticPagesController < ApplicationController
  def home
    if params[:user_id]
      find_user_photos
    end
  end

  private

  def find_user_photos
    flickr = FlickRaw::Flickr.new
    if params[:user_id].present?
      begin
        @photos = flickr.photos.search(user_id: params[:user_id].strip)
      rescue Exception => e
        flash[:error] = e
        redirect_to root_url
      end
    else
      # for when user manaully enters "/?user_id=" as url
      flash.now[:error] = "No user id provided"
      render "home"
    end
  end
end
