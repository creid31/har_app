FactoryBot.define do
  factory :har_file do
    name 'Spotify test'
    description "Archive of spotify's landing page"
    file { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'files', 'spotify.har'), 'application/json') }
  end

  factory :invalid_har, class: HarFile do
    name 'Spotify test'
    description "Archive of spotify's landing page"
    file { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'files', 'ramblinWreck.txt'), 'application/json') }
  end
end
