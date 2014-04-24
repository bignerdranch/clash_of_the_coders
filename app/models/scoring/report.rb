module Scoring
  class Report
    attr_reader :configuration
    def initialize(configuration_hash)
      @configuration = Scoring::Configuration.new(configuration_hash)
    end

    def annotated_teams
      teams.map { |team|
        AnnotatedTeam.new(score_factory: score_factory,
          team: team,
          user: user)
      }
    end

    def year
      Date.today.year
    end

    private

    def score_factory
      configuration.score_factory
    end

    def teams
      configuration.teams
    end

    def user
      configuration.user
    end

    class AnnotatedTeam < SimpleDelegator
      attr_reader :user, :score_factory
      def initialize(team: nil, user: nil, score_factory: nil)
        @user = user
        @score_factory = score_factory
        super(team)
      end

      def score
        score_factory.score_for(user.id, id)
          .value
      end
    end
  end
end
