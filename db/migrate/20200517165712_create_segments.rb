class CreateSegments < ActiveRecord::Migration[5.2]
  def change
    create_table :segments do |t|
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
