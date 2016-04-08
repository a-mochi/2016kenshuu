require 'sinatra'
require 'sinatra/reloader'

class MyApp < Sinatra::Base
    configure :development do
    register Sinatra::Reloader
  end

  #トップページ
  get '/' do
    erb :index
  end

  #探索結果画面
  get '/result' do
    erb :result
    dep_station = params[:dep_station]
    arr_station = params[:arr_station]
  end

end