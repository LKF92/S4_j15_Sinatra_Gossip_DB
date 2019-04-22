require 'bundler'
Bundler.require
require_relative 'gossip'
### heritate from Sinatra's class
class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all} ###locals => push a variable to use in index.erb
  end
### defines the url and the associated view file
  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params['gossip_author'], params['gossip_content']).save
    redirect '/'
  end

  get '/gossips/:id' do
    ### we create a dynamic variable to easily call from show.erb
    erb :show, locals: {gossip_array: Gossip.find(params[:id].to_i)}
  end


end
