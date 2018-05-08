RSpec.describe "Merchant Dashboard" do
  describe "user visits merchant dashboard" do
    it "should show display for each merchant" do
      merchant_1 = Merchant.create(name: "hello")
      merchant_2 = Merchant.create(name: "jabba")
      merchant_1.items.create(name: "foo", description: "bar", unit_price: 15, img: "jkf")
      merchant_1.items.create(name: "baz", description: "bar", unit_price: 15, img: "jkf")
      merchant_1.items.create(name: "cah", description: "bar", unit_price: 20, img: "jkf")
      merchant_1.items.create(name: "asdf", description: "bar", unit_price: 20, img: "jkf")
      merchant_2.items.create(name: "foo", description: "bar", unit_price: 40, img: "jkf")
      merchant_2.items.create(name: "biz", description: "bar", unit_price: 50, img: "jkf")

      
      visit("/merchant-dashboard")

      expect(page).to have_css("#merchant_1")
      expect(page).to have_css("#merchant_2")
    end
    it "should show average unit price" do
      merchant_1 = Merchant.create(name: "hello")
      merchant_2 = Merchant.create(name: "jabba")
      merchant_1.items.create(name: "foo", description: "bar", unit_price: 15, img: "jkf")
      merchant_1.items.create(name: "baz", description: "bar", unit_price: 15, img: "jkf")
      merchant_1.items.create(name: "cah", description: "bar", unit_price: 20, img: "jkf")
      merchant_1.items.create(name: "asdf", description: "bar", unit_price: 20, img: "jkf")
      merchant_2.items.create(name: "foo", description: "bar", unit_price: 40, img: "jkf")
      merchant_2.items.create(name: "biz", description: "bar", unit_price: 50, img: "jkf")

      visit("/merchant-dashboard")

      expect(page.merchant_1.avg_unit_price).to eq(35)
      expect(page.merchant_2.avg_unit_price).to eq(45)
    end 

    it "should show item count" do
      merchant_1 = Merchant.create(name: "hello")
      merchant_2 = Merchant.create(name: "jabba")
      merchant_1.items.create(name: "foo", description: "bar", unit_price: 15, img: "jkf")
      merchant_1.items.create(name: "baz", description: "bar", unit_price: 15, img: "jkf")
      merchant_1.items.create(name: "cah", description: "bar", unit_price: 20, img: "jkf")
      merchant_1.items.create(name: "asdf", description: "bar", unit_price: 20, img: "jkf")
      merchant_2.items.create(name: "foo", description: "bar", unit_price: 40, img: "jkf")
      merchant_2.items.create(name: "biz", description: "bar", unit_price: 50, img: "jkf")

      visit("/merchant-dashboard")

      expect(page.merchant_1.item_count).to eq(4)
      expect(page.merchant_2.item_count).to eq(2)
    end 

    it "should show total cost" do
      merchant_1 = Merchant.create(name: "hello")
      merchant_2 = Merchant.create(name: "jabba")
      merchant_1.items.create(name: "foo", description: "bar", unit_price: 15, img: "jkf")
      merchant_1.items.create(name: "baz", description: "bar", unit_price: 15, img: "jkf")
      merchant_1.items.create(name: "cah", description: "bar", unit_price: 20, img: "jkf")
      merchant_1.items.create(name: "asdf", description: "bar", unit_price: 20, img: "jkf")
      merchant_2.items.create(name: "foo", description: "bar", unit_price: 40, img: "jkf")
      merchant_2.items.create(name: "biz", description: "bar", unit_price: 50, img: "jkf")

      visit("/merchant-dashboard")

      expect(page.merchant_1.total_cost).to eq(70)
      expect(page.merchant_2.total_cost).to eq(90)
    end

    it "should show merchant names" do
      merchant_1 = Merchant.create(name: "hello")
      merchant_2 = Merchant.create(name: "jabba")
      merchant_1.items.create(name: "foo", description: "bar", unit_price: 15, img: "jkf")
      merchant_1.items.create(name: "baz", description: "bar", unit_price: 15, img: "jkf")
      merchant_1.items.create(name: "cah", description: "bar", unit_price: 20, img: "jkf")
      merchant_1.items.create(name: "asdf", description: "bar", unit_price: 20, img: "jkf")
      merchant_2.items.create(name: "fool", description: "bar", unit_price: 40, img: "jkf")
      merchant_2.items.create(name: "biz", description: "bar", unit_price: 50, img: "jkf")

      visit("/merchant-dashboard")

      expect(page).to have_content("hello")
      expect(page).to have_content("jabba")
    end

    it "should show merchant with most items" do
      merchant_1 = Merchant.create(name: "hello")
      merchant_2 = Merchant.create(name: "jabba")
      merchant_1.items.create(name: "foo", description: "bar", unit_price: 15, img: "jkf")
      merchant_1.items.create(name: "baz", description: "bar", unit_price: 15, img: "jkf")
      merchant_1.items.create(name: "cah", description: "bar", unit_price: 20, img: "jkf")
      merchant_1.items.create(name: "asdf", description: "bar", unit_price: 20, img: "jkf")
      merchant_2.items.create(name: "fool", description: "bar", unit_price: 40, img: "jkf")
      merchant_2.items.create(name: "biz", description: "bar", unit_price: 50, img: "jkf")

      visit("/merchant-dashboard")

      
      expect(page.most_items).to have_content("hello")
      expect(page.highest_item).to have_content("jabba")
    end
  end
end
      

