class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
