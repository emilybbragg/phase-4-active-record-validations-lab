class Author < ApplicationRecord

# All authors have a name; no two authors have the same name
  validates :name, presence: true, uniqueness: true

# Author phone numbers are exactly ten digits
  validates :phone_number, length: { is: 10 }
end
