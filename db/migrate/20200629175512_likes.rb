class Likes < ActiveRecord::Migration[5.2]
  def change
    t.integer :user_id
    t.integer :tweet_id
  end
end
