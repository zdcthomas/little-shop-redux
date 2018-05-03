class LittleShopApp < Sinatra::Base
  get '/invoices' do
    @invoices = Invoice.all
    erb :"invoices/index"
  end

  get '/invoices/:id' do
    if Invoice.exists?(params[:id])
      @invoice = Invoice.find(params[:id])
      erb :'invoices/show'
    else
      redirect not_found
    end
  end

  not_found do
    status 404
  end
end
