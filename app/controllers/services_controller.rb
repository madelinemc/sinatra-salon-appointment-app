class ServicesController < ApplicationController

    get '/services/all' do
        @services = Service.all
        erb :'/services/all'
    end

end
