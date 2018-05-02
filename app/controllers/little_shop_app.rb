class LittleShopApp < Sinatra::Base

  get '/merchants' do
    @merchants = Merchant.all
  end 
end
