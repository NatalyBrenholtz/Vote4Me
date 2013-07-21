class IdeasController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  before_action :set_idea, only: [:show, :edit, :update, :destroy, :vote]

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.by_votes
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @idea_vote = current_user_vote || IdeaVote.new
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = current_user.ideas.new(idea_params)
    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render action: 'show', status: :created, location: @idea }
      else
        format.html { render action: 'new' }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  #TODO: should we remove from idea_votes table the deleted ideas records?

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url }
      format.json { head :no_content }
    end
  end

  def vote
    #get existing vote or create a new one
    vote = current_user_vote || current_user.idea_votes.new
    vote.idea_id = params[:id]
    vote.value = params['voting_score'].to_i
    if vote.save
      redirect_to :back, notice: "Thank you for voting."
    else
      redirect_to :back, alert: "Unable to vote, #{vote.errors.full_messages.first}."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    def current_user_vote
      @idea.user_vote(current_user).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:title, :description, :user_id)
    end
end
