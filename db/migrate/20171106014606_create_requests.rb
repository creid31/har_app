class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :index
      t.text :method
      t.text :url
      t.references :har_file, foreign_key: true

      t.timestamps
    end
  end
end
