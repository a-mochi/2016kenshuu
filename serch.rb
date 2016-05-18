require_relative './configure'

def search_lines(station)

  courses = Ekisuke::Course.search("#{station}:22741")

end

def search()

  p "出発駅を入力してください"
  stations = Ekisuke::Station.find("高円寺")
  departure_station = nil
  arrival_station = nil
  search_time = nil

  if stations.empty?
    puts"該当する駅はありません"

  elsif stations.size == 1
    departure_station = stations[0]
    puts"#{stations[0].name}駅を取得しました"
      
  else
    stations.each_with_index do |station,index|
      puts"#{index+1}:#{station.name}"
    end
    p "どの駅にしますか、番号を入力してください"
    number = gets.chomp.to_i

    if number <= stations.size && number > 0
      departure_station = stations[number-1]
      puts "#{stations[number-1].name}を選択しました"

    else
        puts "error"
    end
  end

  courses = search_lines(departure_station.code)

  #経路表示
  if courses.nil? || courses.empty?
    puts "経路が見つかりませんでした"
  else
    
    #1経路目
    course =courses[0]
    puts "合計所要時間：#{course.time}分"
    puts "==========="

    #駅
    stations = course.stations
    #路線
    lines = course.lines
    fares = course.fares

    lines.each_with_index do |line,line_index|
      #駅名
      puts stations[line_index].name
      puts "|#{line.departure_state.datetime.strftime("%H:%M")}"
      #路線名
      puts "|#{line.name}"
      puts "|#{line.arrival_state.datetime.strftime("%H:%M")}"
    end
  #経路の最後の駅を出力
  puts stations[-1].name
  end
end

search()