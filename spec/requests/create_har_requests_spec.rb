require 'rails_helper'

RSpec.describe 'create har', :type => :request do
  context 'with valid file' do
    it 'creates har file' do
      har = FactoryBot.attributes_for(:har_file)
      expect { post '/har_files', params: { har_file: har } }.to change(HarFile, :count)
    end
    it 'displays created file' do
      har = FactoryBot.attributes_for(:har_file)
      post '/har_files', params: { har_file: har }
      expect(response).to redirect_to(HarFile.last)
    end
  end
  describe 'with invalid input' do
    context 'with invalid har fields' do
      it 'does not create har file' do
        har = FactoryBot.attributes_for(:invalid_har)
        expect { post '/har_files', params: { har_file: har } }.not_to change(HarFile, :count)
      end
    end
    context 'with wrong file type' do
      it 'does not create har file' do
        har = FactoryBot.attributes_for(:invalid_file_type)
        expect { post '/har_files', params: { har_file: har } }.not_to change(HarFile, :count)
      end
    end
    context 'with missing name' do
      it 'does not create har file' do
        expect { post '/har_files', params: { har_file: { name: '' } } }.not_to change(HarFile, :count)
      end
    end
  end
end
