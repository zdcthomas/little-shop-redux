class LittleShopApp < Sinatra::Base


  get '/items' do
    @items = Items.all
    erb :'/items'
  end
end
