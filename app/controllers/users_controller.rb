class UsersController < ApplicationController

    #INDEX get '/users/homepage' - render page with sign up or log in links
    get '/users/homepage' do
        erb :'/users/homepage'
    end

    #NEW (SIGN UP) get '/users/signup' - render /users/signup.erb form to sign up aka create new users instance
    get '/users/signup' do
        erb :'/users/signup'
    end

    #CREATE post '/users/signup' - create new users, redirect to '/users/#{users.id}'
    post '/users/signup' do
        user = User.create(params[:user])
        #(username: params[:user][:username], password: params[:user][:password], first_name: params[:user][:first_name], last_name: params[:user][:last_name])
        session[:user_id] = user.id
        redirect to "/users/#{user.id}"
    end

    #SHOW (LOGIN PAGE)
    get '/users/login' do #MAKE HELPER METHOD LATER
        # if is_logged_in
        #     redirect to 'users/:id'
        # else
        #     erb :'/users/login'
        # end
        erb :'/users/login'
    end

    #POST (LOGIN PAGE)
    post '/users/login' do
        user = User.find_by(:username => params[:user][:username])
        if user 
            #&& user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect to "/users/#{user.id}"
        else
        redirect to "/users/signup"
        end
    end

    #DESTROY delete 'users/:id' - find the users, delete the user, redirect to index '/users/homepage' which renders page with sign up or log in links
    get '/users/logout' do
        session.clear
        redirect to "/users/homepage"
    end

    #SHOW (PROFILE PAGE) get '/users/:id' - find newly created users or any users @users = users.find_by_id(params[:id]), THIS IS USER PROFILE PAGE containing list of their appointment instances; render /users/profile.erb
    get '/users/:id' do
        @user = User.find_by_id(params[:id])
        @appointments = appointments_by_user(params[:id])
        erb :'/users/profile'
    end

    helpers do
        def appointments_by_user(user_id) #dont know if this works yet!
            user_appts = []
            user_appts = Appointment.all.find_by(:user_id => params[:id]) 
            user_appts#return array of all apointment instances associated with logged in user. 
        end
    end

end 

#views needed:
# '/users/homepage.erb' - link to view all services + sign up button + log in button
# '/users/signup.erb' - form to create a new user instance. Form includes username, password, first_name, last_name
# '/users/login.erb' - form to sign in/ authenticate existing user
# '/users/profile.erb - users profile page. list of appointment instances belonging to that user + link to book new appointment + log out button
