class HashtagsPolitic < ApplicationRecord
    belongs_to :politic, required: false
    belongs_to :hashtag, required: false
end
