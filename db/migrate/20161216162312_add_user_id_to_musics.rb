class AddUserIdToMusics < ActiveRecord::Migration[5.0]
  def change
    add_column :musics, :user_id, :integer
  end
end
