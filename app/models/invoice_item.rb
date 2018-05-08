class InvoiceItem < ActiveRecord::Base
  validates :merchant_id, presence: true
  validates :item_id, presence: true
  validates :quantity, presence: true
  validates :unit_price, presence: true
end