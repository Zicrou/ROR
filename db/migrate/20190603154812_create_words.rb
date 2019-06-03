class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :nature
      t.string :word
      t.text :exemple

      t.timestamps
    end
  end
end
