class LittleShopApp < Sinatra::Base

  get '/items' do
    @items = Item.all
    erb :'items/index'
  end

  get '/items/:id' do
    @item = Item.find(params['id'])
    erb :'items/show'
  end

  get '/items/new' do
    erb :'items/new'
  end

  post '/items' do
    Item.create(params[:item])

    redirect '/items'
  end
end

#export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES << RUN THIS FOR EVERY NEW TERMINAL SESSION!!
