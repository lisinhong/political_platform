class Politic < ApplicationRecord
    belongs_to :politician
    has_many :hashtags_politics
    has_many :hashtags, :through => :hashtags_politics
    accepts_nested_attributes_for :hashtags_politics
end
