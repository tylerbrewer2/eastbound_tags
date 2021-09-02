class Player < ApplicationRecord
    belongs_to :round

    validates :tag_in, presence: true
    validates :name, presence: true
end
