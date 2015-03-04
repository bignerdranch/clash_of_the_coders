require 'active_model'
require_relative 'configuration'

module Scoring
  class Form
    include ActiveModel::Model

    def self.model_name
      ActiveModel::Name.new(self, nil, 'Scorecard')
    end

    attr_reader :configuration
    def initialize(configuration_hash)
      @configuration = Scoring::Configuration.new(configuration_hash)
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

    def teams
      configuration.teams
    end

    private

    def scores
      configuration.scores
    end

    def score_processor
      configuration.score_processor
    end

    def user
      configuration.user
    end

    def validator
      configuration.validator
    end
  end
end
