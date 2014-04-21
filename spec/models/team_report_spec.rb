require 'spec_helper'
require 'team_report'

describe TeamReport do
  let(:team) { double('Team', id: 1, name: 'team name', raw_score: 100) }
  let(:team_report) { TeamReport.new(team: team, position: 1) }

  it "knows the team's position" do
    expect(team_report.position).to eq('1st')
  end

  it 'delegates additional methods up to the team' do
    expect(team_report.name).to eq('team name')
  end

  it 'returns no position if the team has no score' do
    team = double('Team', id: 1, name: 'team name', raw_score: nil)
    team_report = TeamReport.new(team: team, position: 1)

    expect(team_report.position).to eq('')
  end
end
