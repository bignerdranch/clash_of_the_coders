require 'rails_helper'

describe 'Scoring teams' do
  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user)
      .and_return(current_user)
    allow_any_instance_of(Team).to receive(:bonus?)
      .and_return(false)
  end
  let(:year) { FactoryGirl.create(:competition_year) }
  let(:current_user) { FactoryGirl.create(:user) }
  let!(:team_1) { FactoryGirl.create(:team, competition_year: year) }
  let!(:team_2) { FactoryGirl.create(:team, competition_year: year) }
  let(:team_1_vote) { [{ team: team_1, learning_points: 10, wizardry_points: 20 }] }
  let(:team_2_vote) { [{ team: team_2, learning_points: 11, wizardry_points: 20 }] }

  it 'when your voting is complete, your scores are factored in the scoreboard' do
    visit_scorecard_page
    vote_for_teams(team_1_vote + team_2_vote)
    visit_scoreboard_page

    expect_team_to_have(team: team_1, content: 30.0)
    expect_team_to_have(team: team_1, content: '2nd')
    expect_team_to_have(team: team_2, content: 31.0)
    expect_team_to_have(team: team_2, content: '1st')
  end

  def vote_for_teams(votes_array)
    votes_array.each do |vote|
      fill_in "scores__#{vote[:team].id}_learning_points", with: vote[:learning_points]
      fill_in "scores__#{vote[:team].id}_wizardry_points", with: vote[:wizardry_points]
    end

    find_rel(I18n.t('rel.submit_scorecard')).click
  end
end
