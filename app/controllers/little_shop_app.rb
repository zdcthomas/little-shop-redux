class LittleShopApp < Sinatra::Base
  get ['/merchants', '/merchants/'] do
    @merchants = Merchant.all
    erb :'merchants/index'
  end

  get '/merchants/new' do
    erb :'merchants/new'
  end

  get '/merchants/:id/edit' do
    @merchant = Merchant.find(params[:id])
    erb :'merchants/edit'
  end

  get '/merchants/:id' do
    @merchant = Merchant.find(params[:id])
    erb :'merchants/show'
  end

  put '/merchants/:id' do
    merchant = Merchant.find(params[:id])
    merchant.update(params[:merchant])
    redirect '/merchants'
  end

  post '/merchants/' do
    merchant = Merchant.new(params[:merchant])
    merchant.save
    redirect '/merchants'
  end

  delete '/merchants/:id' do |id|
    Merchant.destroy(id.to_i)
    redirect '/merchants'
  end
end
