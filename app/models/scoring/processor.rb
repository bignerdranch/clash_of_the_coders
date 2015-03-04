require_relative 'configuration'

module Scoring
  class Processor
    attr_reader :configuration
    def initialize(configuration)
      @configuration = configuration
    end

    def save
      scores.each do |score|
        score.user_id = user.id
        score.save
      end
    end

    private

    def scores
      configuration.scores
    end

    def user
      configuration.user
    end
  end
end
