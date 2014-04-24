require 'scoring/configuration'

module Scoring
  class Processor
    attr_reader :configuration
    def initialize(configuration)
      @configuration = configuration
    end

    def save
      scores.each do |score|
        score_factory.create(team_id: score.team_id,
          user_id: user.id,
          value: score.score)
      end
    end

    private

    def scores
      configuration.scores
    end

    def score_factory
      configuration.score_factory
    end

    def user
      configuration.user
    end
  end
end
