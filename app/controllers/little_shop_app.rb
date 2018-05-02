class LittleShopApp < Sinatra::Base

  get '/merchants' do
    @merchants = Merchant.all
    erb :"merchants/index"
  end

  get '/merchants/:id/edit' do
    @merchants = Merchant.find(params[:id])
    erb :edit
end
