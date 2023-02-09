class User < ApplicationRecord
    has_secure_password
    def self.search(pattern)
        if pattern.blank?  # blank? covers both nil and empty string
          all
        else
          where('name LIKE ?', "%#{pattern}%")
        end
    end
end
