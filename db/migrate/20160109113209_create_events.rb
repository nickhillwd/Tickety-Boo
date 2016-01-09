class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :act_id
      t.integer :venue_id
      t.datetime :event_start_time
      t.datetime :event_end_time
      t.text :event_details
      t.decimal :event_price

      t.timestamps null: false
    end
  end
end
