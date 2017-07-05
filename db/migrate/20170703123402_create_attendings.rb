class CreateAttendings < ActiveRecord::Migration[5.0]
  def change
    create_table :attendings do |t|
      t.integer :attended_event_id
      t.integer :attendee_id
      
      t.timestamps
    end
  end
end
