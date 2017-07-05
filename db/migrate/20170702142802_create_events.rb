class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.integer :creator_id
      t.date :date
      t.string :location

      t.timestamps
    end
  end
end
