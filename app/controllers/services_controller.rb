class ServicesController < ApplicationController

    #INDEX get '/' - @services = Service.all >> show all service instances aka "service menu"; redirects to 'services/all.erb'
    get '/services/all' do
        @services = Service.all
        erb :'/services/all'
    end

end

#views needed:
# appointments_controller index redirects to '/services/all.erb'
