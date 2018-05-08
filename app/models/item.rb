class Item < ActiveRecord::Base

  validates :title, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true
  validates :img, presence: true

  belongs_to :merchant
end
