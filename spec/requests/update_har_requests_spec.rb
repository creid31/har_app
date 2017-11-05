require 'rails_helper'

RSpec.describe 'update har', :type => :request do
  let(:har) { FactoryBot.create(:har_file) }
  context 'with valid file' do
    it 'updates har file' do
      updated_fields = FactoryBot.attributes_for(:updated_har)
      expect { put '/har_files', params: { har_file: updated_fields } }.not_to change(HarFile, :count)
      updated_har = HarFile.last
      expect(updated_har.name).to eq(updated_fields.name)
      expect(updated_har.description).to eq(updated_fields.name)
      expect(updated_har.name).to eq(updated_fields.name)
    end
    it 'displays updated file' do
      updated_fields = FactoryBot.attributes_for(:updated_har)
      put '/har_files', params: { har_file: updated_fields }
      expect(response).to redirect_to(HarFile.last)
    end
  end
  describe 'with invalid input' do
    context 'with invalid har fields' do
      it 'does not update har file' do
        updated_fields = FactoryBot.attributes_for(:invalid_har)
        put '/har_files', params: { har_file: updated_fields }
        updated_har = HarFile.last
        expect(updated_har.name).not_to eq(updated_fields.name)
        expect(updated_har.description).not_to eq(updated_fields.name)
        expect(updated_har.name).not_to eq(updated_fields.name)
        expect(response).to render_template(:edit)
      end
    end
    context 'with wrong file type' do
      it 'does not update har file' do
        updated_fields = FactoryBot.attributes_for(:invalid_file_type)
        put '/har_files', params: { har_file: updated_fields }
        updated_har = HarFile.last
        expect(updated_har.name).not_to eq(updated_fields.name)
        expect(updated_har.description).not_to eq(updated_fields.name)
        expect(updated_har.name).not_to eq(updated_fields.name)
        expect(response).to render_template(:edit)
      end
    end
    context 'with missing name' do
      it 'does not update har file' do
        put '/har_files', params: { har_file: { name: '' } }
        expect(har.name).not_to eq('')
      end
    end
  end
end
