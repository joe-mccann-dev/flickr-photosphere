module FlickrPhotosphere
  class Application < Rails::Application
    config.before_initialize do
      FlickRaw.api_key = ENV['FLICKRAW_API_KEY']
      FlickRaw.shared_secret = ENV['FLICKRAW_SHARED_SECRET']
    end
  end
end
