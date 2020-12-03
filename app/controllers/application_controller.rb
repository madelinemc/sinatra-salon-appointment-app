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

  end
    
end
