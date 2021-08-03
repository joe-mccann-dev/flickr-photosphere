require "rails_helper"
require "capybara/mechanize"

Capybara.register_driver :mechanize do |app|
  Capybara::Mechanize::Driver.new(app)
end

RSpec.describe "StaticPages", type: :system do
  before do
    # capybara-mechanize is a capybara extension that allows navigating to external URLs from within test
    # https://github.com/jeroenvandijk/capybara-mechanize
    # inherits majority of functionality from the RackTest driver
    driven_by(:mechanize)
  end

  describe "Looking up a Flickr ID's photos" do
    include StaticPagesHelper

    context "a user visits the home page and wants to see the photos of a particular Flickr profile" do
      let(:flickr_id) { "adamwoodworth" }
      let(:flickr) { FlickRaw::Flickr.new }
      let(:photos) { flickr.photos.search(user_id: flickr_id) }

      before :each do
        visit root_url
        fill_in "user_id", with: flickr_id
        click_on "View Photos"
      end

      it "allows them to fill in an ID and see the photos associated with that ID" do
        photos.each do |photo|
          image_source = flickr_source_url(photo)
          expect(page).to have_css("img[src*='#{image_source}']")
        end
      end

      it "allows them to click on an image" do
        # click on first image result
        photo = photos.first

        # photos.first will have id of "photo-0"
        find("#photo-0").click
        expect(current_url).to eq(flickr_image_page(photo))
      end
    end
  end
end
