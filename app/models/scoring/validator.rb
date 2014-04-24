require 'scoring/configuration'

module Scoring
  class Validator
    attr_reader :configuration
    def initialize(configuration_hash)
      @configuration = Scoring::Configuration.new(configuration_hash)
    end

    def valid?
      scores_by_user.count != teams_to_be_scored.count
    end

    private
    attr_reader :score_factory, :team_factory

    def scores
      configuration.scores
    end

    def scores_by_user
      @scores_by_user ||= score_factory.by_user(user)
    end

    def score_factory
      configuration.score_factory
    end

    def team_factory
      configuration.team_factory
    end

    def teams_to_be_scored
      @teams_to_be_scored ||= team_factory.in_same_year(scores.first.id)
    end

    def user
      configuration.user
    end
  end
end
