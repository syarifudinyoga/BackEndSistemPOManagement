class Clien < ApplicationRecord
  has_many :employee
    def self.search(pattern)
        if pattern.blank?  # blank? covers both nil and empty string
          all
        else
          where('client_name LIKE ?', "%#{pattern}%")
        end
    end
end
