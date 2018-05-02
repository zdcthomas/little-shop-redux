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

  post '/merchants' do
    task = merchant.new(params[:merchant])
    task.save
    redirect '/merchants'
  end

  delete '/merchants/:id' do |id|
  Task.destroy(id.to_i)
  redirect '/merchants'
  end
end
