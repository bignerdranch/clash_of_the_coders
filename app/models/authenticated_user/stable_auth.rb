module AuthenticatedUser
  class StableAuth < OpenStruct
    def initialize(auth_hash)
      super(
        auth_hash.merge(
          email: auth_hash[:info][:email],
          name: auth_hash[:info][:full_name]
          )
        )
    end
  end
end
