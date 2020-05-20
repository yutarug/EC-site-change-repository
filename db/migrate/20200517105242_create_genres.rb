class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :name
      t.boolean :effectice_status, default: false, null:false

      t.timestamps
    end
  end
end