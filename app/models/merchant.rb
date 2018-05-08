class Merchant < ActiveRecord::Base
  validates :name, presence: true

  has_many :items

  def self.most_items
    Merchant.info.order('item_count DESC').first.id
  end

  def self.highest_priced_item
    Item.order('unit_price DESC').first.merchant.id
  end

  def self.info
    Merchant.joins(:items).select("merchants.*, avg(items.unit_price) as avg_price, sum(items.unit_price) as total_cost, count(items.id) as item_count").group("merchants.id")
  end

end
