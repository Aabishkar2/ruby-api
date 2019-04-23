class Article < ApplicationRecord
	self.table_name = "articles"
	validates :title, presence: true
	validates :body, presence: true
end
