class RemoveGenreFromMusics < ActiveRecord::Migration[5.0]
  def change
    remove_column :musics, :genre, :string
  end
end
