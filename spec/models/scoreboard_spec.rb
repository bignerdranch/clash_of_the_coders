require 'rails_spec_helper'

describe Scoreboard do
  before do
  end

  describe 'fetching scores' do
    let(:year) { CompetitionYear.create(year: 2014) }
    let(:year_earlier) { CompetitionYear.create(year: 2013) }
    let(:team_1) { FactoryGirl.create(:team, competition_year: year) }
    let(:team_2) { FactoryGirl.create(:team, competition_year: year) }
    let(:team_3) { FactoryGirl.create(:team, competition_year: year_earlier) }
    let(:user_1) { FactoryGirl.create(:user) }
    let(:user_2) { FactoryGirl.create(:user) }

    let(:scoreboard) { Scoreboard.new(year: 2014) }

    before do
      Scorecard.create(user: user_1,
        scores: [
          {id: team_1.id, score: 100},
          {id: team_2.id, score: 200},
          {id: team_3.id, score: 300}
        ])
      Scorecard.create(user: user_2,
        scores: [
          {id: team_1.id, score: 200},
          {id: team_2.id, score: 300},
          {id: team_3.id, score: 400}
        ])
    end

    it 'gets the score for each team for the year' do
      expect(scoreboard.score(team_1.id)).to eq(150.0)
      expect(scoreboard.score(team_2.id)).to eq(250.0)
    end

    it 'does not have scores for any other teams' do
      expect(scoreboard.scores.keys).to match_array([team_1.id, team_2.id])
    end
  end
end
