class UsersController < ApplicationController

    # get '/' do #INDEX
    #     redirect to '/##'
    # end

    #INDEX get '/users/homepage' - render page with sign up or log in links

    #NEW (SIGN UP) get '/users/signup' - render /users/signup.erb form to sign up aka create new users instance

    #CREATE post '/users' - create new users, redirect to '/users/#{users.id}'

    #SHOW (PROFILE PAGE) get '/users/:id' - find newly created users or any users @users = users.find_by_id(params[:id]), render /users/show.erb; THIS IS USER PROFILE PAGE containing list of their appointment instances

    #do I need the below 3?
    #EDIT  get '/users/:id/edit' - find users by id, render /users/edit.erb form for user to edit their credentials

    #UPDATE patch '/users/:id' - find the users and make updates, redirect to view the edited users at '/users/#{users.id}' which is the profile page containing list of their appointment instances

    #DESTROY delete 'users/:id' - find the users, delete the user, redirect to index '/users/homepage' which renders page with sign up or log in links

end 

#views needed:
# '/users/homepage.erb' - link to view all services + sign up button + log in button
# '/users/signup.erb' - form to create a new user instance. Form includes username, password, first_name, last_name
# '/users/login.erb' - form to sign in/ authenticate existing user
# '/users/show.erb - users profile page. list of appointment instances belonging to that user + link to book new appointment + log out button

#do I need this one?
# '/users/edit.erb' - form for user to update their password, first_name, last_name.