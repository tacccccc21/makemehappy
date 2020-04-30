class AddStarToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :star, :float
  end
end
