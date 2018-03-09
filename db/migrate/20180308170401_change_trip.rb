class ChangeTrip < ActiveRecord::Migration[5.1]
  def change
    remove_reference(:trips, :user, index: true)
    add_column :trips, :sender, :string
  end
end
