class CreateIdeaVotes < ActiveRecord::Migration
  def change
    create_table :idea_votes do |t|
      t.belongs_to :idea
      t.belongs_to :user
      t.integer :value, default: 0

      t.timestamps
    end
    add_index :idea_votes, :idea_id
    add_index :idea_votes, :user_id
  end
end
