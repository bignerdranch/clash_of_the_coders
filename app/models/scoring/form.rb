require 'active_model'

module Scoring
  class Form
    include ActiveModel::Model

    def self.model_name
      ActiveModel::Name.new(self, nil, 'Scorecard')
    end

    attr_reader :teams
    def initialize(teams: nil)
      @teams = teams
    end

    def persisted?
      false
    end

    def persist
    end

    def submit
      if valid?
        persist
      else
        false
      end
    end
  end
end
