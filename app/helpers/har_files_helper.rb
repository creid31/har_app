# Helper methods to extract out shared processing logic between controller/view
module HarFilesHelper
  def retrieve_file_content(path)
    content = File.read(path)
    JSON.parse(content)
  end
end
