module StaticPagesHelper
  def flickr_source_url(photo)
    id = photo.id
    server_id = photo.server
    secret = photo.secret
    size_suffix = 'w'
    "https://live.staticflickr.com/#{server_id}/#{id}_#{secret}_#{size_suffix}.jpg"
  end

  def flickr_image_page(photo)
    "https://flickr.com/photos/#{params[:user_id]}/#{photo.id}"
  end

end
