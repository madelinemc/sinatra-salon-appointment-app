class ServicesController < ApplicationController

    get '/services/all' do
        @services = Service.all
        erb :'/services/all'
    end

    get '/services/most-popular' do
        services = Service.all
        @most_popular = services.max_by { |service| service.appointments.length }
        erb :'services/most-popular'
    end

end

#Write a custom route so that when a user visits /services/most-popular the user sees the service with the most appointments associated with it 
#HINT Use the max_by Ruby method to help you find the service that has the most appointments associated with it. 
