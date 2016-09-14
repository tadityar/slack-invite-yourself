require 'sinatra'
require 'open-uri'
require 'nokogiri'

get '/' do
  erb :index
end

post '/invite' do
  if params[:email]
    token = ENV['APP_TOKEN']
    channels = ENV['CHANNELS'] #separated with commas
    response = open("https://slack.com/api/users.admin.invite?token=#{token}&channels=#{channels}&email=#{params[:email]}&first_name=Example&set_active=true").read
    erb :invited, :locals => {'email' => params[:email]}
  else
    erb :index
  end
end
