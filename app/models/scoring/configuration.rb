module Scoring
  class Configuration < OpenStruct
    def initialize(args={})
      super(args)
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
