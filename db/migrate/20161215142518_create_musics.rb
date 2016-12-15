class CreateMusics < ActiveRecord::Migration[5.0]
  def change
    create_table :musics do |t|
      t.string :album
      t.string :track
      t.string :artist
      t.string :genre
      t.string :released_year

      t.timestamps
    end
  end
end
