class Post < ApplicationRecord

# All posts have a title
validates :title, presence: true
# Post content is at least 250 characters long
validates :content, length: { minimum: 250 } 
# Post summary is a maximum of 250 characters
validates :summary, length: { maximum: 250 } 
# Post category is either Fiction or Non-Fiction
validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
# add a custom validator to the Post model that ensures the title is sufficiently clickbait-y
validate :clickbait?

CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top \d/i,
    /Guess/i
  ]

  def clickbait?
    if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end

end