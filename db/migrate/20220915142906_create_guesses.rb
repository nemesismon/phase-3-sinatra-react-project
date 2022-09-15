class CreateGuesses < ActiveRecord::Migration[6.1]
  def change
    create_table :guesses do |t|
      t.string :actor
      t.integer :player_id
      t.timestamps
    end
  end
end
