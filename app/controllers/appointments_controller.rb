class AppointmentsController < ApplicationController

    #INDEX get '/appointments' - @services = Service.all >> show all services "service menu"
    get '/appointments' do
        redirect to "/services/all"
    end

    #NEW get '/appointments/new' - render /appointments/new.erb form to create new appointments instance
    get '/appointments/new' do
        validate
        @services = Service.all
        erb :'/appointments/new'
    end

    #CREATE post 'appointments' - create new appointments, redirect to '/appointent/#{appointments.id}'
    post '/appointments/new' do
        validate
        appointment = Appointment.create(params[:appointment])
        appointment.user_id = session[:user_id]
        appointment.save
        flash[:success] = "Successfully booked - see you soon!"
        redirect to "/appointments/#{appointment.id}"
    end

    #SHOW get '/appointments/:id' - find newly created appointments or any appointments, render /appointments/show.erb
    get '/appointments/:id' do
        validate
        @appointment = Appointment.all.find_by_id(params[:id])
        @user = User.find_by_id(@appointment.user_id)
        @service = Service.find_by_id(@appointment.service_id)
        erb :'/appointments/show'
    end

    #EDIT  get '/appointments/:id/edit' - find appointments by id, render /appointments/edit.erb form to edit appointments
    get '/appointments/:id/edit' do
        validate
        @appointment = Appointment.find_by_id(params[:id])
        @services = Service.all
        erb :'/appointments/edit'
    end

    #UPDATE patch '/appointments/:id' - find the appointments and make updates, redirect to view the edited appointments at '/appointments/#{appointments.id}'
    patch '/appointments/:id' do
        validate
        @appointment = Appointment.find_by_id(params[:id])
        if @appointment.user_id == session[:user_id]
            @appointment.date = params[:appointment][:date]
            @appointment.time = params[:appointment][:time]
            @appointment.service_id = params[:appointment][:service_id]
            @appointment.save
            redirect to "/appointments/#{@appointment.id}"
        else
            "This is not your appointment so you cannot edit it!"
        end
    end

    #DESTROY delete 'appointments/:id' - find the appointments, delete it, redirect to user profile or index aka "service menu"
    delete '/appointments/:id/delete' do
        validate
        appointment = Appointment.find_by_id(params[:id])
        appointment.delete
        redirect to "/users/homepage"
    end


end

#views needed:
# index redirects to '/services/all.erb'
# '/appointments/new.erb' - form for user to create new instance of appointments. includes time, date, user_id, service_id
# '/appointments/show.erb' - show page for a specific appointments with all details of that instance. 
# '/appointments/edit.erb' - form for user to update an appointments. includes time, date, user_id, service_id