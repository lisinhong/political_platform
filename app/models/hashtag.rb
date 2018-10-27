class Hashtag < ApplicationRecord
     has_many :hashtags_politics
     has_many :politcs, :through => :hashtags_politics
     accepts_nested_attributes_for :hashtags_politics
     after_find :get_politic_type
     attr_accessor :politic_type

     def get_politic_type
        type_array = ["內政","交通","經濟","教育文化","青年發展","公民政治"]
        if self.politic_type_id.present?
            self.politic_type = type_array[self.politic_type_id]
        end
     end
end
