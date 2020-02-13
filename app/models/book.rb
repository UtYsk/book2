class Book < ApplicationRecord
	belongs_to :user
	validates :title, length: { in: 1..30 }

	validates :body, length: { in: 1..199 }

end

