class Politician < ApplicationRecord
    has_many :politics
    has_many :results
end
