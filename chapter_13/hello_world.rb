require 'sinatra'

get '/' do
  'Hello, world!'
end

get '/bye' do
  'Leaving already?'
end

get '/time' do
  Time.now.to_s
end

get 'add/:a/:b' do
  (params[:a].to_i + params[:b].to_i).to_s
end

