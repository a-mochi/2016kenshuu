require "sinatra/base"
require "sinatra/reloader"
require_relative './configure'

class MyApp < Sinatra::Base
    configure :development do
    register Sinatra::Reloader
  end

# puts Course = Ekisuke::Course.search("#{@dep_station[0].code}:#{@arr_station[0].code}","20160101","1400",{searchType:"arrival",answerCount:2})

  #トップページ
  get '/' do
    now_time = Time.now

    erb :index
  end

  get '/select' do
    @dep_station = Ekisuke::Station.find(params[:dep_station])
    @mid_station = Ekisuke::Station.find(params[:mid_station])
    @arr_station = Ekisuke::Station.find(params[:arr_station])
    @dep_h = params[:dep_h]
    @dep_t = params[:dep_t]

    erb :select
  end

  #探索結果画面
  get '/result' do
    @dep_h = "#{params[:dep_h]}" + "#{params[:dep_t]}"
    @dep_t 

    # @dep_time = "18" + "00"
    @dep_mid_courses = Ekisuke::Course.search("#{params[:dep_station]}:#{params[:mid_station]}","20160101",@dep_h)
    
    
      
      erb :result
  end
end