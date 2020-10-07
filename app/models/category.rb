class Category < ApplicationRecord
    belongs_to :vertical
    has_one :course
end
