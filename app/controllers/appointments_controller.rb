class AppointmentsController < ApplicationController

    #INDEX 
    get '/appointments' do
        redirect to "/services/all"
    end

    #NEW 
    get '/appointments/new' do
        validate
        @services = Service.all
        erb :'/appointments/new'
    end

    #CREATE
    post '/appointments/new' do
        validate
        appointment = Appointment.create(params[:appointment])
        appointment.user_id = session[:user_id]
        appointment.save
        flash[:success] = "Successfully booked - see you soon!"
        redirect to "/appointments/#{appointment.id}"
    end

    #SHOW
    get '/appointments/:id' do
        validate
        @appointment = Appointment.all.find_by_id(params[:id])
        @user = User.find_by_id(@appointment.user_id)
        @service = Service.find_by_id(@appointment.service_id)
        erb :'/appointments/show'
    end

    #EDIT
    get '/appointments/:id/edit' do
        validate
        @appointment = Appointment.find_by_id(params[:id])
        @services = Service.all
        erb :'/appointments/edit'
    end

    #UPDATE
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

    delete '/appointments/:id/delete' do
        validate
        appointment = Appointment.find_by_id(params[:id])
        appointment.delete
        redirect to "/users/homepage"
    end


end
