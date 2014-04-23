require 'active_model'

module Scoring
  class Form
    include ActiveModel::Model

    def self.model_name
      ActiveModel::Name.new(self, nil, 'Scorecard')
    end

    attr_reader :scores, :score_processor, :teams, :user
    def initialize(scores: nil, teams: nil, user: nil, validator: nil, score_processor: Scoring::Processor)
      @scores = scores
      @score_processor = score_processor
      @teams = teams
      @user = user
      @validator = validator
    end

    def persisted?
      false
    end

    def persist
      if validator.valid?
        score_processor.save
      end
    end

    def submit
      if valid?
        persist
      else
        false
      end
    end

    private

    def validator
      @validator ||= Scoring::Validator.new(scores: scores, user: user)
    end
  end
end
