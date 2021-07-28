module StaticPagesHelper

  # https://www.flickr.com/services/api/misc.urls.html

  # Suffix 	Class 	Longest edge (px) 	Notes
  #   s	   thumbnail	75	 cropped     square
  #   q	   thumbnail	150	 cropped     square
  #   t	   thumbnail	100	
  #   m	   small	    240	
  #   n	   small	    320	
  #   w	   small	    400	
  # (none) medium	    500	
  #   z	   medium	    640	
  #   c	   medium	    800

  def flickr_source_url(photo)
    id = photo.id
    server_id = photo.server
    secret = photo.secret
    size_suffix = 'q'
    # "https://live.staticflickr.com/#{server_id}/#{id}_#{secret}_#{size_suffix}.jpg"
    "https://live.staticflickr.com/#{server_id}/#{id}_#{secret}.jpg"
  end

  def flickr_image_page(photo)
    "https://flickr.com/photos/#{photo.owner}/#{photo.id}"
  end

  def alt_image_description(index)
    "Flickr profile #{params[:user_id]} photo ##{index + 1}"
  end

  def profile_photos_page(user)
    "https://www.flickr.com/photos/#{user}/"
  end
end
