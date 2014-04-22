require 'rails_spec_helper'

describe 'Scoreboard' do
  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user)
      .and_return(current_user)
  end
  let(:current_user) { FactoryGirl.create(:user) }
  let!(:team_1) { FactoryGirl.create(:team, name: 'team 1') }
  let!(:team_2) { FactoryGirl.create(:team, name: 'team 2') }
  let!(:team_3) { FactoryGirl.create(:team, name: 'team 3') }

  describe 'viewing the scoreboard' do
    before do
      allow_any_instance_of(Team).to receive(:bonus?)
        .and_return(false)
      Scorecard.create(scores: [
          { id: team_1.id, score: 90 },
          { id: team_2.id, score: 95 }],
        user: current_user)

      visit_scoreboard_path
    end

    it 'shows the score for each team' do
      within(dom_id(team_1)) do
        expect(page).to have_content(90)
      end
      within(dom_id(team_2)) do
        expect(page).to have_content(95)
      end
    end

    it 'shows the position for each team' do
      within(dom_id(team_1)) do
        expect(page).to have_content('2nd')
      end
      within(dom_id(team_2)) do
        expect(page).to have_content('1st')
      end
    end

    it 'shows a 0 score and no rank for teams with no score' do
      within(dom_id(team_3)) do
        expect(page).to have_content(0)
        expect(page).to_not have_content('3rd')
      end
    end
  end
end
