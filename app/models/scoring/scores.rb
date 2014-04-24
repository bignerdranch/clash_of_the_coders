module Scoring
  class Scores
    def self.build(scores)
      return scores if scores.first.respond_to? :team_id
      scores.map { |id, value|
        OpenStruct.new(team_id: id.to_i,
          score: value.to_i)
      }
    end
  end
end
