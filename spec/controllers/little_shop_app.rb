class ItemFile < Sinatra::Base

  get '/films' do
    @items = Items.all
    erb :"items/index"
  end

end
