require 'rails_spec_helper'

describe 'Teams' do
  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user)
      .and_return(current_user)
  end
  let(:current_user) { FactoryGirl.create(:user) }
  let(:team_name) { 'The best team' }

  it 'a user can create a new team and add members to that team' do
    visit_new_team_page
    fill_in_new_team_information
    expect_new_team_to_exist
  end

  def fill_in_new_team_information
    fill_in 'team_name', with: team_name
    select current_user.name, from: 'team_member_ids'
    find_rel(I18n.t('rel.submit_team')).click
  end

  def expect_new_team_to_exist
    expect(page).to have_content(team_name)
  end
end
