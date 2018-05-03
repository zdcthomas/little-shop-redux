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

  get '/invoices/:id/edit' do
    if Invoice.exists?(params[:id])
      @invoice = Invoice.find(params[:id])
      erb :'invoices/edit'
    else
      redirect not_found
    end

  post '/invoices' do
    invoice = Invoice.new(params[:invoice])
    invoice.save
    redirect '/invoices'
  end

  not_found do
    status 404
  end

end
