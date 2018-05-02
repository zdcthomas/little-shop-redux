class LittleShopApp < Sinatra::Base

  get ['/merchants', '/merchants/'] do
    @merchants = Merchant.all
    erb :'merchants/index'
  end

  get '/merchants/:id/edit' do
    @merchants = Merchant.find(params[:id])
    erb :'merchants/edit'
  end

  get '/merchants/:id' do
    @merchant = Merchant.find(params[:id])
    erb :'merchants/show'
  end
end
