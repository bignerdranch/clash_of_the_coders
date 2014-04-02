module AuthenticatedUser
  class UserLookup
    def self.run(stable_auth)
      new(stable_auth).run
    end

    attr_reader :stable_auth
    def initialize(stable_auth, user_factory: User)
      @stable_auth = stable_auth
      @user_factory = user_factory
    end

    def run
      user_factory.where(email: stable_auth.email)
        .first
        .presence || user_factory.create(stable_auth)
    end

    private
    attr_reader :user_factory
  end
end
