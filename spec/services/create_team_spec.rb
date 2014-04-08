require 'rails_spec_helper'
require 'create_team'

describe CreateTeam do
  it 'creates a team for the appropriate competition year' do
    CompetitionYear.create(year: Date.today.year)

    expect {
      CreateTeam.new({name: 'some team name'})
        .save
    }.to change{ Team.count }.by(1)
  end
end
