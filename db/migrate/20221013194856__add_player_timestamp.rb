class AddPlayerTimestamp < ActiveRecord::Migration[6.1]
  def change
    add_timestamps :players, null: true
  end
end
