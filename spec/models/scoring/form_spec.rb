require 'spec_helper'
require 'scoring/form'

describe Scoring::Form do
  let(:teams) { [double('Team'), double('Team')] }
  let(:form) { Scoring::Form.new(teams: teams) }

  it 'exposes the teams it knows about' do
    expect(form.teams).to eq(teams)
  end
end
