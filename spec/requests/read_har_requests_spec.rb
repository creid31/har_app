require 'rails_helper'

RSpec.describe 'retrieving hars', :type => :request do
  context 'home page' do
    it 'displays headers' do
      get har_files_path
      assert_select 'h1', 'Har Files'
    end
    it 'existing displays har files' do
      FactoryBot.create(:har_file)
      get har_files_path
      assert_select 'table' do
        assert_select 'tbody' do
          assert_select 'tr', 1
        end
      end
    end
  end
  context 'single har' do
    it 'displays all content' do
      har = FactoryBot.create(:har_file)
      get har_files_path(har)
      expect(response).to be_success
    end
  end
end
