require "rails_helper"

# Specs in this file have access to a helper object that includes
# the StaticPagesHelper. For example:
#
# describe StaticPagesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe StaticPagesHelper, type: :helper do
  describe StaticPagesHelper do
    let(:flickr_id) { "adamwoodworth" }
    let(:flickr) { FlickRaw::Flickr.new }
    let(:photo) { flickr.photos.search(user_id: flickr_id).first }

    describe "#flickr_source_url" do
      let(:source_url) { flickr_source_url(photo) }

      it "returns the flickr source url for a given photo " do
        server = photo.server
        id = photo.id
        secret = photo.secret
        expected_source_url = "https://live.staticflickr.com/#{server}/#{id}_#{secret}.jpg"
        expect(source_url).to eq(expected_source_url)
      end
    end

    describe "#flickr_image_page" do
      let(:image_url) { flickr_image_page(photo) }

      it "returns the url for the flickr.com image page" do
        owner = photo.owner
        id = photo.id
        expected_image_url = "https://flickr.com/photos/#{owner}/#{id}"
        expect(image_url).to eq(expected_image_url)
      end
    end

    describe "#alt_image_description" do
      let(:index) { 0 }
      let(:alt_text) { alt_image_description(index, flickr_id) }

      it "returns a description of the photo that contains photo owner information and its index on page" do
        expected_alt_text = "Flickr profile #{flickr_id} photo ##{index + 1}"
        expect(alt_text).to eq(expected_alt_text)
      end
    end

    describe "#profile_photos_page" do
      let(:profile_url) { profile_photos_page(flickr_id) }

      it "returns the url for the Flickr page for a given flickr id" do
        expected_profile_url = "https://www.flickr.com/photos/#{flickr_id}/"
        expect(profile_url).to eq(expected_profile_url)
      end
    end
  end
end
