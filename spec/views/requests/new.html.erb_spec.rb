require 'rails_helper'

RSpec.describe "requests/new", type: :view do
  before(:each) do
    assign(:request, Request.new(
      :index => 1,
      :method => "MyText",
      :url => "MyText",
      :har_file => nil
    ))
  end

  it "renders new request form" do
    render

    assert_select "form[action=?][method=?]", requests_path, "post" do

      assert_select "input[name=?]", "request[index]"

      assert_select "textarea[name=?]", "request[method]"

      assert_select "textarea[name=?]", "request[url]"

      assert_select "input[name=?]", "request[har_file_id]"
    end
  end
end
