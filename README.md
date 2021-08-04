## Flickr Photosphere

### Highlights

* Utilizes the [Flickr API](https://www.flickr.com/services/api/) to return a list of public photos upon form submission.

* Allows viewing of a given Flickr user's public photos
    * Visit the the application [page](https://flickr-photosphere.herokuapp.com/).
    * Enter a Flickr ID, e.g. "adamwoodworth" or "94494572@40N07".
    * Click "View Photos".
    * The [Flickraw gem](https://github.com/hanklords/flickraw) connects to Flickr API.
    * See that user's public photos appear on the same [page](https://github.com/joe-mccann-dev/flickr-photosphere/blob/main/app/views/static_pages/home.html.erb).

### What I learned

  1. How to read and apply an API's [documentation](https://www.flickr.com/services/api/)
  2. How to setup ENV variables in `.bashrc` config file, e.g.

      ```bash
        export FLICKRAW_API_KEY="api_key_goes_here"
        export FLICKRAW_SHARED_SECRET="shared_secret_goes_here"
      ```

  3. How to setup [config vars](https://devcenter.heroku.com/articles/config-vars) on Heroku

      ```bash
        heroku config:set FLICKRAW_API_KEY=api_key_goes_here
        heroku config:set FLICKRAW_SHARED_SECRET=shared_secret_goes_here
      ```

  4. How to use the [capybara-mechanize gem](https://github.com/jeroenvandijk/capybara-mechanize) to access external urls within an RSpec system test
     see [spec/system/static_pages_spec.rb](https://github.com/joe-mccann-dev/flickr-photosphere/blob/main/spec/system/static_pages_spec.rb)
  5. How to setup a custom initializer for the Flickraw gem, e.g.

      ```ruby
      # config/initializers.flickraw.rb
        module FlickrPhotosphere
          class Application < Rails::Application
            config.before_initialize do
              FlickRaw.api_key = ENV['FLICKRAW_API_KEY']
              FlickRaw.shared_secret = ENV['FLICKRAW_SHARED_SECRET']
            end
          end
        end
      ```
