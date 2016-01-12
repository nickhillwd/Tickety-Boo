class CreateEventGenres < ActiveRecord::Migration
  def change
    create_table :event_genres do |t|
      t.string :event_id
      t.string :genre_id

      t.timestamps null: false
    end
  end
end
