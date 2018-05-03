class LittleShopApp < Sinatra::Base

  get '/' do
    erb :'welcome'
  end

  get '/items' do
    @items = Item.all
    erb :'items/index'
  end

  get '/items/new' do
    erb :'items/new'
  end

  post '/items' do
    item = Item.create(params[:item])
    item.save

    redirect '/items'
  end

  get '/items/:id' do
    if Item.exists(params[:id])
      @item = Item.find(params['id'])
       erb :'items/show'
    else

    redirect not_found
    end
  end


  get '/items/:id/edit' do
    @item = Item.find(params['id'])
    erb :'items/edit'
  end

  post '/items/:id/edit' do
    @item = Item.find(params['id'])
    item.update(params[:item])

    redirect '/items'
  end
end

#export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES << RUN THIS FOR EVERY NEW TERMINAL SESSION!!
