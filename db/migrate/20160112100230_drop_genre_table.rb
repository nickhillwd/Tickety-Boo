class DropGenreTable < ActiveRecord::Migration
  def change
    drop_table :genre
  end
end
