RSpec.describe HarController do
  describe 'POST #create' do
    context 'when file is valid' do
      it 'creates har entry' do
        har_content = FactoryGirl.build(:har_file)
        expect{ post :create, {har_content: har_content}}.to change(HarFile, :count)
        expect(response).to redirect_to index
      end
    end
    context 'when file is invalid' do
      it 'does not create har entry' do
        har_content = FactoryBot.build(:invalid_har)
        expect{ post :create, {har_content: har_content}}.not_to change(HarFile, :count)
        expect(response).to redirect_to index
      end
    end
  end

  describe 'GET #' do

  end

  describe 'PUT #update' do

  end

  describe 'DELETE' do

  end
end
