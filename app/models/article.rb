class Article < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true

    has_many :comments, dependent: :destroy
    belongs_to :model
end
