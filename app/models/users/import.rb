module Users
  class Import
    def self.run(user_factory=User)
      Stable.all.each do |user|
        db_user = user_factory.where(email: user.email).first
        user_factory.create(user.attributes) if db_user.nil?
      end
    end
  end
end
