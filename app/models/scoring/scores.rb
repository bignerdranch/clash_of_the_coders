module Scoring
  class Scores
    def self.build(scores, score_factory: ::Score)
      return scores if scores.first.respond_to? :team_id
      scores.map { |id, score_set|
        score_factory.new(team_id: id.to_i,
                          learning_points: score_set['learning_points'].to_i,
                          wizardry_points: score_set['wizardry_points'].to_i)
      }
    end
  end
end
