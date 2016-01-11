class AddColumnDetailsToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :venue_details, :text
  end
end
