class LittleShopApp < Sinatra::Base

  get '/invoices' do
    @invoices = Invoice.all
    erb :"invoices/index"
  end

  get '/invoices/:id' do
    if Invoice.exists?(params[:id])
      @invoice = Invoice.find(params[:id])
      erb :"invoices/show"
    else
      redirect not_found
    end
  end

  get '/invoices/:id/edit' do
    if Invoice.exists?(params[:id])
      @invoice = Invoice.find(params[:id])
      erb :"invoices/edit"
    else
      redirect not_found
    end
  end

  put '/invoices/:id' do
    invoice = Invoice.find(params[:id])
    invoice.update(params[:invoice])
    redirect "/invoices/#{params[:id]}"
  end

  delete 'invoices/:id' do |id|
    Task.destroy(id.to_i)
    redirect '/invoices'
  end

  get ['/merchants', '/merchants/'] do
    @merchants = Merchant.all
    erb :'merchants/index'
  end

  get '/' do
    erb :'welcome'
  end

  get '/items' do
    @items = Item.all
    erb :'items/index'
  end

  get '/items/new' do
    @items = Item.all
    @merchants = Merchant.all
    erb :'items/new'
  end

  post '/items' do
    item = Item.create(params[:item])
    item.save

    redirect '/items'
  end

  get '/items/:id' do
    if Item.exists?(params[:id])
      @item = Item.find(params[:id])
       erb :'items/show'
    else
      redirect not_found
    end
  end

  delete '/items/:id' do |id|
    Item.destroy(params[:id])

    redirect '/items'
  end

  get '/items/:id/edit' do
    @item = Item.find(params[:id])
    @merchants = Merchant.all
    erb :'items/edit'
  end

  put '/items/:id' do
    @item = Item.find(params[:id])
    @item.update(params[:item])

    redirect '/items'
  end

  post '/items/' do
    item = Item.new(params[:item])
    item.save
    redirect '/items'
  end

  get '/merchants' do
    @merchants = Merchant.all
    erb :"merchants/index"
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
    @items = Item.group(params[:merchant_id])
    erb :'merchants/show'
  end

  put '/merchants/:id' do
    @merchant = Merchant.find(params[:id])
    @merchant.update(params[:merchant])
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

  not_found do
    status 404
  end

end

#export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES << RUN THIS FOR EVERY NEW TERMINAL SESSION!!
