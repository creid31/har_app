class RenameUrlFieldOnRequest < ActiveRecord::Migration[5.1]
  def change
    rename_column :requests, :url, :uri
  end
end
