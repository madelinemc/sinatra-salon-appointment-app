require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "supersecret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :home
  end

  helpers do

    def is_logged_in
      !!session[:user_id]
    end

    def current_user
      User.find_by_id(id: [:user_id])
    end

    def authorized_to_edit(appointment) #this is not implemented yet
      appointment.user_id == session[:user_id]
    end
  end
    
end
