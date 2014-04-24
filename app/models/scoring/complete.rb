module Scoring
  class Complete
    def self.check?(year: nil, user: nil)
      teams = Team.for_year(year)
      teams.count == teams.scored_by_user(user).count
    end
  end
end
