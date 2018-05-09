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

      
      visit("/merchants-dashboard")
      # save_and_open_page
      within('#merchant_1') do
        expect(page).to have_content('hello')
      end
      within('#merchant_2') do
        expect(page).to have_content('jabba')
      end
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

      visit("/merchants-dashboard")

      within('.avg_unit_price_1') do
        expect(page).to have_content(17.5)
      end
      within('.avg_unit_price_2') do
        expect(page).to have_content(45.0)
      end
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

      visit("/merchants-dashboard")
      within('.item_count_1') do
        expect(page).to have_content(4)
      end
      within('.item_count_2') do
        expect(page).to have_content(2)
      end
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

      visit("/merchants-dashboard")
      within('.total_cost_1') do
        expect(page).to have_content(70)
      end
      within('.total_cost_2') do
        expect(page).to have_content(90)
      end
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

      visit("/merchants-dashboard")

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

      visit("/merchants-dashboard")

      within('#most_items') do
        expect(page).to have_content('hello')
      end
      within('#highest_price') do
        expect(page).to have_content('jabba')
      end
    end
  end
end
      

