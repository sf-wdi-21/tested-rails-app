class Recipe < ActiveRecord::Base
  validates :title, presence: true
  validates :instructions, presence: true
end
