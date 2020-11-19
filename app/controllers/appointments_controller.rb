class AppointmentsController < ApplicationController
    # get '/' do 
    #     redirect to '/##'
    # end

    ####should it be appointment or appointmentS ?

    #INDEX get '/appointments' - @services = Service.all >> show all services "service menu"
    #should this go inside my services_controller?

    #NEW get '/appointments/new' - render /appointments/new.erb form to create new appointments instance
    get '/appointments/new' do
        erb :'/appointments/new'
    end

    #CREATE post 'appointments' - create new appointments, redirect to '/appointent/#{appointments.id}'
    post '/appointments/new' do
        appointment = Appointment.create(params[:****])
        redirect to "/appointments/#{appointments.id}"
    end

    #SHOW get '/appointments/:id' - find newly created appointments or any appointments, render /appointments/show.erb
    get 'appointments/:id' do
        @appointments = Appointment.find_by(:user_id => params[:user.id])
        erb :'/appointments/show'
    end

    #EDIT  get '/appointments/:id/edit' - find appointments by id, render /appointments/edit.erb form to edit appointments

    #UPDATE patch '/appointmenst/:id' - find the appointments and make updates, redirect to view the edited appointments at '/appointments/#{appointments.id}'

    #DESTROY delete 'appointments/:id' - find the appointments, delete it, redirect to user profile or index aka "service menu"


end

#views needed:
# index redirects to '/services/all.erb'
# '/appointments/new.erb' - form for user to create new instance of appointments. includes time, date, user_id, service_id
# '/appointments/show.erb' - show page for a specific appointments with all details of that instance. 
# '/appointments/edit.erb' - form for user to update an appointments. includes time, date, user_id, service_id