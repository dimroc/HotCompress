require 'spec_helper'

describe "url_pairs/list_all.html.haml" do
    include Devise::TestHelpers

 	before(:each) do
		@u = Fabricate(:user)
		sign_in @u
		@uid  = @u.id
		@url_pair = Fabricate(:url_pair)
		assign(:url_pairs, UrlPair.all)
	end
	it "renders a full list of all url_pairs" do
		render
		assert_select "tr>td", :text => @url_pair.long_url, :count => UrlPair.count
	end
end
