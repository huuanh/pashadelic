require 'rails_helper'

RSpec.describe "images/new", type: :view do
  before(:each) do
    assign(:image, Image.new(
      :category => nil,
      :user => nil,
      :img_url => "MyString"
    ))
  end

  it "renders new image form" do
    render

    assert_select "form[action=?][method=?]", images_path, "post" do

      assert_select "input#image_category_id[name=?]", "image[category_id]"

      assert_select "input#image_user_id[name=?]", "image[user_id]"

      assert_select "input#image_img_url[name=?]", "image[img_url]"
    end
  end
end
