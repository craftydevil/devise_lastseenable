require 'devise_lastseenable/hooks/lastseenable'

module Devise
  module Models
    module Lastseenable
      def stamp!
        if self.last_seen.to_i < (Time.now.utc - 5.minutes).to_i
          update_column(:last_seen, DateTime.now)
        end
      end
    end
  end
end
