class UsersController < ApplicationController

    get '/users/homepage' do
        erb :'/users/homepage'
    end

    get '/users/signup' do
        erb :'/users/signup'
    end

    post '/users/signup' do
        user = User.create(params[:user])
        session[:user_id] = user.id
        redirect to "/users/#{user.id}"
    end

    get '/users/login' do 
        if logged_in?
            redirect to "/users/#{session[:user_id]}"
        else
            erb :'/users/login'
        end
    end

    post '/users/login' do
        user = User.find_by(:username => params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            flash[:success] = "Successfully signed in!"
            redirect to "/users/#{user.id}"
        elsif user && !user.authenticate(params[:user][:password])
            flash[:failure] = "Oops wrong password!"
            redirect to "/users/login"
        else
            flash[:success] = "Looks like this is your first time here - please sign up!"
            redirect to "/users/signup"
        end
    end

    get '/users/logout' do
        session.clear
        redirect to "/users/homepage"
    end

    get '/users/:id' do
        validate
        @user = User.find_by_id(session[:user_id])
        @appointments = appointments_by_user
        erb :'/users/profile'
    end

    helpers do
        def appointments_by_user
           Appointment.all.select do |appt|
            appt.user_id == session[:user_id]
           end #return array of all apointment instances associated with logged in user. 
        end
    end

end 
