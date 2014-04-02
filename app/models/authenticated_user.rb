require 'authenticated_user/stable_auth'
require 'authenticated_user/user_lookup'

module AuthenticatedUser
  def self.find_or_create(stable_auth)
    UserLookup.run(stable_auth)
  end
end
