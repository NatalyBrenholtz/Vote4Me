class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :name, :password, :encrypted_password

  has_many :ideas
  has_many :idea_votes

  def total_votes
    IdeaVote.joins(:idea).where(ideas: {user_id: self.id}).sum('value')
  end

  # TODO: check here if user's budget allows the voting
  def can_vote_for?(idea)
    idea_votes.build(idea: idea).valid?
  end

end