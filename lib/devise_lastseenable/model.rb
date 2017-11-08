require 'devise_lastseenable/hooks/lastseenable'

module Devise
  module Models
    module Lastseenable
      def stamp!
        self.update_column(:last_seen, DateTime.now) if self.last_seen.to_i < (Time.now - 5.minutes).to_i
      end
    end
  end
end