class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :tag_in
      t.integer :tag_out
      t.integer :score
      t.belongs_to :round, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
