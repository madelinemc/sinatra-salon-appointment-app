class AppointmentsController < ApplicationController
    # get '/' do 
    #     redirect to '/##'
    # end

    #INDEX get '/appointment' - IS THIS PROFILE PAGE? or @services = Service.all >> show all services "service menu"

    #NEW get '/appointment/new' - render /appointment/new.erb form to create new appointment instance

    #CREATE post 'appointment' - create new appointment, redirect to '/appointent/#{appointment.id}'

    #SHOW get '/appointment/:id' - find newly created appointment or any appointment @appointment = Appointment.find_by_id(params[:id]), render /appointment/show.erb

    #EDIT  get '/appointment/:id/edit' - find appointment by id, render /appointment/edit.erb form to edit appointment 

    #UPDATE patch '/appointment/:id' - find the appointment and make updates, redirect to view the edited appointment at '/appointment/#{appointment.id}'

    #DESTROY delete 'appointment/:id' - find the appointment, delete it, redirect to user profile or index aka "service menu"


end