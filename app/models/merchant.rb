class Merchant < ActiveRecord::Base
  validates :name, presence: true

  has_many :items

  def self.most_items
    Merchant.info.order('item_count DESC').first
  end

  def self.highest_priced_item
    Item.order('unit_price DESC').first.merchant
  end

  def self.info
    joins(:items).select('merchants.*, avg(items.unit_price) AS avg_price, sum(items.unit_price) AS total_cost, count(items.id) AS item_count').group('merchants.id')

  end

end
