class HashtagsPolitic < ApplicationRecord
    belongs_to :politc, required: false
    belongs_to :hashtag, required: false
end
