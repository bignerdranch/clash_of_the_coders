require 'rails_spec_helper'

describe Team do
  describe '#bonus?' do
    let(:team) { FactoryGirl.create(:team) }
    let(:member_1) { FactoryGirl.create(:user, bnr_team_id: 1) }
    let(:member_2) { FactoryGirl.create(:user, bnr_team_id: 2) }
    let(:member_3) { FactoryGirl.create(:user, bnr_team_id: 2) }

    it 'returns true if the team members are all on a different team' do
      team.members << member_1
      team.members << member_2
      expect(team.bonus?).to be_truthy
    end

    it 'returns false if any two team members are on the same team' do
      team.members << member_2
      team.members << member_3
      expect(team.bonus?).to be_falsy
    end
  end

  describe '.in_same_year' do
    let!(:year) { FactoryGirl.create(:competition_year) }
    let!(:team_same_1) { FactoryGirl.create(:team, competition_year: year) }
    let!(:team_same_2) { FactoryGirl.create(:team, competition_year: year) }
    let!(:team_different_1) { FactoryGirl.create(:team) }

    it 'finds all the teams in the same year as the one passed in' do
      expect(Team.in_same_year(team_same_1.id)).to match_array([team_same_1, team_same_2])
    end
  end
end
