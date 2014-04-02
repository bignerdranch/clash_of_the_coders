require 'open-uri'
require 'json'

module Users
  class Stable
    STABLE_API_KEY = ENV['STABLE_API_KEY'] || 'anything'
    USERS_ENDPOINT = 'https://stable.bignerdranch.com/users.json?api_key=' + STABLE_API_KEY

    def self.all
      new.all
    end

    def all
      json.map { |user|
        Nerd.new(user)
      }
    end

    private

    def json
      open(USERS_ENDPOINT) { |file|
        JSON.parse(file.read) }
    end

    Nerd = Struct.new(:hash) do
      def active
        hash['active']
      end

      def email
        hash['email']
      end

      def gravatar
        hash['gravatar_url']
      end

      def name
        hash['full_name']
      end

      def team_id
        hash['team_id']
      end

      def uid
        hash['uid']
      end
    end
  end
end
