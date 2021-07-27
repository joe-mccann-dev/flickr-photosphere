class StaticPagesController < ApplicationController

  def home
    if params[:user_id]
      find_user_photos
    end
  end

  private

  def find_user_photos
    begin
      flickr = FlickRaw::Flickr.new
      @photos = flickr.photos.search(user_id: params[:user_id].strip)
    rescue Exception => e
      flash[:error] = e
      redirect_to root_url
    end
  end
end