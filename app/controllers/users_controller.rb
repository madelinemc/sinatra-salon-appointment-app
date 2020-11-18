class UsersController < ApplicationController

    # get '/' do #INDEX
    #     redirect to '/##'
    # end

    #INDEX get '/users' - render page with sign up or log in links

    #NEW get '/users/new' - render /users/new.erb form to create new users instance

    #CREATE post 'users' - create new users, redirect to '/users/#{users.id}'

    #SHOW get '/users/:id' - find newly created users or any users @users = users.find_by_id(params[:id]), render /users/show.erb; THIS IS USER PROFILE PAGE containing list of their appointment instances

    #EDIT  get '/users/:id/edit' - find users by id, render /users/edit.erb form for user to edit their credentials

    #UPDATE patch '/users/:id' - find the users and make updates, redirect to view the edited users at '/users/#{users.id}' which is the profile page containing list of their appointment instances

    #DESTROY delete 'users/:id' - find the users, delete the user, redirect to index '/users' which renders page with sign up or log in links

end