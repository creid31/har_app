require 'rails_helper'

RSpec.describe 'delete har', :type => :request do
  it "destroys the requested request" do
    har_file = FactoryBot.create(:har_file)
    expect {
      delete "/har_files/#{har_file.id}", params: {id: har_file.to_param}
    }.to change(HarFile, :count).by(-1)
  end

  it "redirects to the requests list" do
    har_file = FactoryBot.create(:har_file)
    delete "/har_files/#{har_file.id}", params: {id: har_file.to_param}
    expect(response).to redirect_to(har_files_url)
  end
end
