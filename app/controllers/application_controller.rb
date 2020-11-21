require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "5b397928e3c16ef1f7d9"
  end

  get "/" do
    erb :'/users/homepage'
  end

  helpers do #not implemented yet

    def logged_in?
      !!session[:user_id]
    end

    def current_user 
      @current_user ||= User.find(session[:user_id]) if is_logged_in?
    end

    def validate 
      redirect if '/' if !logged_in?
    end

    def authorized_to_edit(appointment)
      appointment.user_id == session[:user_id]
    end

  end
    
end
