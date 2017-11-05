class CreateHarFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :har_files do |t|
      t.string :name
      t.text :description
      t.string :content

      t.timestamps
    end
  end
end
