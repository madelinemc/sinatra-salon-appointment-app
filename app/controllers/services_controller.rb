class ServicesController < ApplicationController

    #INDEX get '/' - @services = Service.all >> show all service instances aka "service menu"; redirects to 'services/all.erb'

    #stretch goal:
    #SHOW get 'services/:id' = find service by id (user clicks links from all.erb page), render 'services/show.erb' view with individual service instance details.

end

#views needed:
# appointments_controller index redirects to '/services/all.erb'

#stretch goal: '/services/show.erb' - show page for a specific service with all details of that instance: name, duration, price, (appointment_id - perhaps use to show IF they have this service currently booked)