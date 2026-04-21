class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  scope :search, ->(query) {
    where("title LIKE :q OR body LIKE :q", q: "%#{sanitize_sql_like(query)}%")
  }
end
