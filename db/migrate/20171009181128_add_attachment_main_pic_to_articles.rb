class AddAttachmentMainPicToArticles < ActiveRecord::Migration[5.1]
  def self.up
    change_table :articles do |t|
      t.attachment :main_pic
    end
  end

  def self.down
    remove_attachment :articles, :main_pic
  end
end
