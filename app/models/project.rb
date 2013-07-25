class Project < ActiveRecord::Base
  belongs_to :topic
  attr_accessible :direction, :title
validates :title, presence: true
end
