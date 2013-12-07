class Message < ActiveRecord::Base

  attr_accessor :country, :source, :description
  attr_accessible :country, :source, :description

  acts_as_taggable

  validates :tag_list, presence: true
end