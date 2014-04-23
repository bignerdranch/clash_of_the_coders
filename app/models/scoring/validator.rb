module Scoring
  class Validator
    attr_reader :scores, :user
    def initialize(scores: nil, score_factory: Score, team_factory: Team, user: nil)
      @scores = scores
      @score_factory = score_factory
      @team_factory = team_factory
      @user = user
    end

    def valid?
      scores_by_user.count != teams_to_be_scored.count
    end

    private
    attr_reader :score_factory, :team_factory

    def scores_by_user
      @scores_by_user ||= score_factory.by_user(user)
    end

    def teams_to_be_scored
      @teams_to_be_scored ||= team_factory.in_same_year(scores.first.id)
    end
  end
end
