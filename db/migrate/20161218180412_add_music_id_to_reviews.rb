class AddMusicIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :music_id, :integer
  end
end
