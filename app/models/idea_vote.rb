class IdeaVote < ActiveRecord::Base

  attr_accessible :value, :idea, :idea_id

  belongs_to :user
  belongs_to :idea

  validates_uniqueness_of :idea_id, scope: :user_id
  validates_inclusion_of :value, in: Array(1..3)
  validate :ensure_not_author

  def ensure_not_author
    errors.add :user_id, " is the author of the idea" if idea.user_id == user_id
  end
end