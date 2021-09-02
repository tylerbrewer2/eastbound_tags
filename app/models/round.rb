class Round < ApplicationRecord
    has_many :players
    after_initialize :init

    validates :name, presence: true

    def init
        self.complete ||= false
    end

    def complete_round
        tag_numbers = players.pluck(:tag_in).sort
        players.order(:score, :tag_in).each do |player|
            player.tag_out = tag_numbers.shift
            player.save!
        end
    end

    def open_round
        players.each do |player|
            player.tag_out = nil
            player.save!
        end
    end
end
