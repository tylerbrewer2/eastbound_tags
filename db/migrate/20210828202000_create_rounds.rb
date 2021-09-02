class CreateRounds < ActiveRecord::Migration[6.1]
  def change
    create_table :rounds do |t|
      t.string :name
      t.boolean :complete, default: false

      t.timestamps
    end
  end
end
