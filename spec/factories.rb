FactoryBot.define do

  factory :har_file do
    before(:create) do |har_file|
      har_file.requests << create_list(:request, 1, har_file: har_file)
    end
    factory :valid_har, class: HarFile do
      name 'Spotify test'
      description "Archive of spotify's landing page"
      content { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'files', 'spotify.har'), 'application/json') }
    end

    factory :invalid_har, class: HarFile do
      name 'Spotify invalid'
      description "Spotify's landing page HAR with invalid fields"
      content { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'files', 'invalid_spotify.har'), 'application/json') }
    end

    factory :invalid_file_type, class: HarFile do
      name 'Ramblin Wreck'
      description "Lyrics for ramblin' wreck"
      content { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'files', 'ramblinWreck.txt'), 'application/json') }
    end

    factory :updated_har, class: HarFile do
      name 'Spotify test updated'
      description "Updated archive of spotify's landing page"
      content { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'files', 'updated_spotify.har'), 'application/json') }
    end
  end

  factory :request do
    add_attribute(:method) { 'GET' }
    uri 'xkcd.com'
  end
end
