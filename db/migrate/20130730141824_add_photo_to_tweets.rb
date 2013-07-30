class AddPhotoToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :photo, :string
  end
end
