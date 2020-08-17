class Article < ApplicationRecord
    has_one_attached :eyecatch
    
    validates :title, presence: true
    validates :content, presence: true
    
    has_many :cards
    has_many :comments, dependent: :destroy
    belongs_to :model
end
