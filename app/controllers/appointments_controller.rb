class AppointmentsController < ApplicationController
    # get '/' do 
    #     redirect to '/##'
    # end

    ####should it be appointment or appointmentS ?

    #INDEX get '/appointment' - @services = Service.all >> show all services "service menu"
    #should this go inside my services_controller?

    #NEW get '/appointment/new' - render /appointment/new.erb form to create new appointment instance

    #CREATE post 'appointment' - create new appointment, redirect to '/appointent/#{appointment.id}'

    #SHOW get '/appointment/:id' - find newly created appointment or any appointment @appointment = Appointment.find_by_id(params[:id]), render /appointment/show.erb

    #EDIT  get '/appointment/:id/edit' - find appointment by id, render /appointment/edit.erb form to edit appointment 

    #UPDATE patch '/appointment/:id' - find the appointment and make updates, redirect to view the edited appointment at '/appointment/#{appointment.id}'

    #DESTROY delete 'appointment/:id' - find the appointment, delete it, redirect to user profile or index aka "service menu"


end

#views needed:
# index redirects to '/services/all.erb'
# '/appointments/new.erb' - form for user to create new instance of appointment. includes time, date, user_id, service_id
# '/appointments/show.erb' - show page for a specific appointment with all details of that instance. 
# '/appointments/edit.erb' - form for user to update an appointment. includes time, date, user_id, service_id