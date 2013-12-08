class Message < ActiveRecord::Base

  attr_accessible :country, :source, :description

  acts_as_taggable

  validates :tag_list, presence: true

  def populate_tags
    self.tag_list = self.description.scan(/#[a-zA-Z0-9]+/).join(', ')
  end

end