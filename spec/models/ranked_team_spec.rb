require 'spec_helper'
require 'ranked_team'

describe RankedTeam do
  let(:team) { double('Team', id: 1, name: 'team name') }
  let(:ranked_team) { RankedTeam.new(team: team,
      position: 1) }

  it "knows the team's position" do
    expect(ranked_team.position).to eq('1st')
  end

  it 'delegates additional methods up to the team' do
    expect(ranked_team.name).to eq('team name')
  end
end
