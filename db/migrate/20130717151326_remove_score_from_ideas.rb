class RemoveScoreFromIdeas < ActiveRecord::Migration
  def change
    remove_column :ideas, :score, :integer
  end
end
