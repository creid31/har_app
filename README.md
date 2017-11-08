# README
## Purpose
The app was built to become better familiar with HTTP Archive files, CarrierWave, and the latest changes in Rails 5.1.

## App Setup
### Versions
* Ruby: 2.3.4p301
* Rails: 5.1.4
* Postgres: 10.0

### Database creation
Postgres user with creatdb role should be created and added to the database.yml

## Usage
Minimal request specs exist and can be run with `rspec spec`. These tests use four existing files in `spec/support/files` and these files can be reused when manually running the app. These files are:
* spotify.har: A valid HAR file from spotify's landing page
* invalid_spotify.har: A HAR file with a request that does not have a URL which is considered not optional.
* updated_spotify.har: A duplicate of the spotify.har file with some changes and only one request.
* ramblinWreck.txt: A text file which is not accepted by this application

While running the app/server (`rails s`), the below functions are available.
* List HAR files
	* `GET /har_files` and `GET /har_files.json`
* Create HAR files
	* `POST /har_files/new`
	* Suggestion: try this action with each of the HAR files used in tests. Can only try this with a HAR file without requests to see the application handle that failure as well.
* Show a single HAR file
	* `GET /har_files/{id}`
* Update a HAR file
	* `PUT /har_files/{id}/edit`
	* Can be tested with the updated_spotify.har file
* Deleting a HAR file
	* `DELETE /har_files/{id}`
* List all requests for a HAR file
	* `GET /har_files/{id}/requests` and `GET /har_file/{id}/requests.json`
	* Retrieves only the method and uri of the HAR file requests
	* Testing suggestion: Upload multiple HAR files (spotify.har and updated_spotify.har) and ensure that requests for updated_spotify.har call is the only show when this call is made.
* Show a single request for a HAR file with index
	* `GET /har_files/{id}/requests{index}`
	* Testing suggestion: Upload multiple HAR files (spotify.har and updated_spotify.har) and ensure the call to the 0 index of the updated_spotify.har does not return the same results as 0 index of spotify.har

## Notes
Currently, only requests are being parsed, validated and returned.  Request fields are persisted to a database to save processing of the file when all requests from a file or a specific request is retrieved. Project can be enhanced by parsing, validating, and returning all fields. There are various ways this can be done:
* Option 1: Iterate through the key value pairs of the json contents which would most likely result in nested if and for loop statements checking the key and then validating the value
* Option 2: Leverage ActiveModel's validation functionality without persisting data. With this, creating a new Log model or a new Entry will read in the json for the object and can be validated as stipulated by models.
* Option 3: Persist data with validations on active model. Benefits of the above but parsing will only need to be done once.