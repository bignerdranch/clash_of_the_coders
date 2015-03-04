require 'models/scoring/processor'

describe Scoring::Processor do
  let(:user) { double('User', id: 1) }
  let(:score_1) { double('TeamScore', team_id: 1, score: 10) }
  let(:score_2) { double('TeamScore', team_id: 2, score: 20) }
  let(:scores) { [score_1, score_2] }
  let(:config) { Scoring::Configuration.new(scores: scores, user: user) }

  before do
    class_double('Score').as_stubbed_const
    allow(score_1).to receive(:save) { true }
    allow(score_2).to receive(:save) { true }
  end

  describe '#save' do
    let(:processor) { Scoring::Processor.new(config) }

    it 'creates a Score for each team' do
      expect(score_1).to receive(:save)
      expect(score_1).to receive(:user_id=).with(user.id)
      expect(score_2).to receive(:save)
      expect(score_2).to receive(:user_id=).with(user.id)

      expect(processor.save).to be_truthy
    end
  end
end
