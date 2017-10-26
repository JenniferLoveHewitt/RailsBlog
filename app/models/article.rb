class Article < ApplicationRecord

  has_attached_file :main_pic, styles: { large: "1000x1000#", medium: "550x550#" }
  validates_attachment_content_type :main_pic, content_type: /\Aimage\/.*\z/

  after_initialize :init

  validates :content, presence: {message: "Content should not be empty"}
  validates :title, presence: {message: "Title should not be empty"}
  validates :content, length: {minimum: 30, message: "30 symbols are minimum"}

  def init
    self.rating = 0
    self.view_count = 0
  end
end
