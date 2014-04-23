require 'spec_helper'
require 'scoring/form'

describe Scoring::Form do
  before do
    stub_const('Scoring::Validator', Class.new)
    stub_const('Scoring::Processor', Class.new)
  end

  it 'exposes the teams it knows about' do
    teams = [double('Team'), double('Team')]
    form = Scoring::Form.new(teams: teams)
    expect(form.teams).to eq(teams)
  end

  describe 'processing scores' do
    let(:team_1) { double('Team', id: 1) }
    let(:team_2) { double('Team', id: 2) }
    let(:user) { double('User', id: 1) }
    let(:scores) { {team_1.id => 10, team_2.id => 20} }

    describe 'when the scores can be saved' do
      let(:validator) { double('Scoring::Validator', :valid? => true) }
      let(:score_processor) { double('Scoring::Processor', save: true) }
      let(:form) { Scoring::Form.new(teams: [team_1, team_2],
          scores: scores,
          score_processor: score_processor,
          user: user,
          validator: validator) }

      it 'returns true' do
        expect(form.persist).to be_truthy
      end

      it 'saves the scores' do
        expect(score_processor).to receive(:save)
          .and_return(true)
        form.persist
      end
    end
  end
end
