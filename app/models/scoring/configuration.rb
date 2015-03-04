require 'ostruct'
require_relative 'scores'

module Scoring
  class Configuration < OpenStruct
    MAX_LEARNING_SCORE = 20.freeze
    MAX_WIZARDRY_SCORE = 65.freeze

    def initialize(args={})
      super(args)
    end

    def max_learning_score
      MAX_LEARNING_SCORE
    end

    def max_wizardry_score
      MAX_WIZARDRY_SCORE
    end

    def max_score
      max_learning_score + max_wizardry_score
    end

    def scores
      @scores ||= Scoring::Scores.build(@table[:scores])
    end

    def score_factory
      @table[:score_factory] || Score
    end

    def team_factory
      @table[:team_factory] || Team
    end

    def validator
      @table[:validator] || Scoring::Validator.new(self)
    end

    def score_processor
      @table[:score_processor] || Scoring::Processor.new(self)
    end
  end
end
