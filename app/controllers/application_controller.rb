require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "5b397928e3c16ef1f7d9"
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
