require 'rails_helper'

describe Score do
  let(:user) { FactoryGirl.create(:user) }
  let!(:score_1) { FactoryGirl.create(:score, user: user) }
  let!(:score_2) { FactoryGirl.create(:score) }

  specify '.by_user' do
    expect(Score.by_user(user)).to match_array([score_1])
  end
end
