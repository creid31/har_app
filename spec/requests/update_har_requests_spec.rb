require 'rails_helper'

RSpec.describe 'update har', :type => :request do
  let!(:har) { FactoryBot.create(:valid_har) }
  context 'with valid file' do
    it 'updates har file' do
      updated_fields = FactoryBot.attributes_for(:updated_har)
      id = har.id
      expect { put "/har_files/#{har.id}", params: { har_file: updated_fields } }.not_to change(HarFile, :count)
      updated_har = HarFile.find(har.id)
      expect(updated_har.name).to eq(updated_fields[:name])
      expect(updated_har.description).to eq(updated_fields[:description])
      expect(updated_har.content_identifier).to eq(updated_fields[:content].original_filename)
    end
    it 'displays updated file' do
      updated_fields = FactoryBot.attributes_for(:updated_har)
      put "/har_files/#{har.id}", params: { har_file: updated_fields }
      expect(response).to have_http_status(302)
    end
  end
  describe 'with invalid input' do
    context 'with missing entries' do
      it 'does not update har file' do
        updated_fields = FactoryBot.attributes_for(:invalid_har)
        put "/har_files/#{har.id}", params: { har_file: updated_fields }
        updated_har = HarFile.find(har.id)
        expect(updated_har.name).not_to eq(updated_fields[:name])
        expect(updated_har.description).not_to eq(updated_fields[:description])
        expect(updated_har.content_identifier).not_to eq(updated_fields[:content].original_filename)
        expect(response).to be_success
      end
    end
    context 'with wrong file type' do
      it 'does not update har file' do
        updated_fields = FactoryBot.attributes_for(:invalid_file_type)
        put "/har_files/#{har.id}", params: { har_file: updated_fields }
        updated_har = HarFile.find(har.id)
        expect(updated_har.name).not_to eq(updated_fields[:name])
        expect(updated_har.description).not_to eq(updated_fields[:description])
        expect(updated_har.content_identifier).not_to eq(updated_fields[:content].original_filename)
        expect(response).to have_http_status(500)
      end
    end
    context 'with missing name' do
      it 'does not update har file' do
        put "/har_files/#{har.id}", params: { har_file: { name: '' } }
        expect(har.name).not_to eq('')
      end
    end
  end
end
