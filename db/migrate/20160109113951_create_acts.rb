class CreateActs < ActiveRecord::Migration
  def change
    create_table :acts do |t|
      t.string :act_name
      t.text :act_details
      t.string :act_image

      t.timestamps null: false
    end
  end
end
