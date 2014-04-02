require 'spec_helper'
require 'users/stable'
require 'web_spec_helper'

describe Users::Stable do
  before do
    json = File.open('spec/support/files/nerds.json', 'r') { |file|
      file.read }
    stub_request(:any, Users::Stable::USERS_ENDPOINT)
      .to_return(body: json)
  end
  let(:users) { Users::Stable.all }

  it 'fetches all the current users via the stable api' do
    names = users.map(&:name)
    expected_names = ['Aaron Hillegass', 'Adam Preble', 'Admin Big Nerd', 'Agnes Mackintosh']
    expect(names).to match_array(expected_names)
  end
end
