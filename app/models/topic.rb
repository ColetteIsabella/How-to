class Topic < ActiveRecord::Base

  attr_writer :description, :name
   validates :name, presence: true
   validates :description, presence: true
  has_many :projects, :dependent => :delete_all
end
