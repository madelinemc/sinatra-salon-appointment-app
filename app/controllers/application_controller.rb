require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "5b397928e3c16ef1f7d9"
    register Sinatra::Flash
  end

  get "/" do
    erb :'/users/homepage'
  end

  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def validate 
      redirect to "/users/signup" if !logged_in?
    end

    def get_time(appointment)
      if appointment.time <= 11
        "#{appointment.time}:00 am"
      elsif appointment.time == 12
        "#{appointment.time}:00 pm"
      else
        "#{appointment.time - 12}:00 pm"
      end
    end

  end
    
end
