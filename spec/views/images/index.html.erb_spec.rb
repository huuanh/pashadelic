require 'rails_helper'

RSpec.describe "images/index", type: :view do
  before(:each) do
    assign(:images, [
      Image.create!(
        :category => nil,
        :user => nil,
        :img_url => "Img Url"
      ),
      Image.create!(
        :category => nil,
        :user => nil,
        :img_url => "Img Url"
      )
    ])
  end

  it "renders a list of images" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Img Url".to_s, :count => 2
  end
end
