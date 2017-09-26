class Kyoku < ApplicationRecord

	validates :day, presence: true
	validates :senkei, presence: true

end
