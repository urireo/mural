class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :caption
      t.text :comment
      t.integer :user_id
      t.integer :segment_id
      t.integer :visitor_id
      t.timestamps
    end
  end
end
