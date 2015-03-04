require 'rails_helper'

describe 'Scoreboard' do
  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user)
      .and_return(current_user)
  end
  let(:current_user) { FactoryGirl.create(:user) }
  let!(:team_1) { FactoryGirl.create(:team, name: 'team 1') }
  let!(:team_2) { FactoryGirl.create(:team, name: 'team 2') }

  describe 'viewing the scoreboard' do
    before do
      allow_any_instance_of(Team).to receive(:bonus?)
        .and_return(false)
      Scorecard.create(scores: [
          { id: team_1.id, score: 90 },
          { id: team_2.id, score: 95 }],
        user: current_user)

      visit_scoreboard_page
    end

    it 'shows the score for each team' do
      expect_team_to_have(team: team_1, content: 90)
      expect_team_to_have(team: team_2, content: 95)
    end

    it 'shows the position for each team' do
      expect_team_to_have(team: team_1, content: '2nd')
      expect_team_to_have(team: team_2, content: '1st')
    end
  end
end
