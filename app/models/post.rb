class Post < ActiveRecord::Base

  belongs_to :author

  before_validation :make_title_case

  validate :is_title_case

  #before_save :email_author_about_post


  private

  def is_title_case
    #split the title into words. If the first letter of the word is not an upcase.
    if title.split.any?{|word| word[0].upcase != word[0]}
      #this let 'em know with this error.
      errors.add(:title, "Title must be in title case")
    end
  end

  def make_title_case
    self.title = self.title.titlecase
  end
end
