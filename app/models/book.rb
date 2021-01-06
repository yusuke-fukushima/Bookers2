class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def self.search(search,word)
    if search == 'forword_match'
      Book.where('title LIKE?', '#{word}%')
    elsif search == 'backword_match'
      Book.where('title LIKE?', '%#{word}')
    elsif search == 'perfect_match'
      Book.where(title: word)
    elsif search == 'partial_match'
      Book.where('title LIKE?','%#{word}%')
    else
      Book.all
    end
  end
  
  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200}
end
