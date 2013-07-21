class Idea < ActiveRecord::Base

  belongs_to :user
  has_many :idea_votes

  attr_accessible :title, :description

  def self.by_votes
    select('ideas.*, sum(coalesce(value, 0)) as votes').
    joins('left join idea_votes on ideas.id = idea_votes.idea_id').
    group('ideas.id').
    order('votes desc')
  end

  def votes
    read_attribute(:votes) || idea_votes.sum(:value)
  end
end
