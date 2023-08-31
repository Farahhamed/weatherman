require 'date'
require 'colorize'

module Calculations

  def calculate_max_temp(data_arr)
    highest_temp = 0
    highest_date = ''
    data_arr.each do |val|
      if highest_temp < val[1].to_i
        highest_temp = val[1].to_i
        highest_date = val[0]
      end
    end
    display_hightest_temp(highest_temp, highest_date)
  end

  def display_hightest_temp(temp, date)
    date = Date.parse(date)
    formatted_date = date.strftime("%B %e")
    puts "Highest: #{temp}C on #{formatted_date}"
  end

  def calculate_min_temp(data_arr)
    lowest_temp = 999
    lowest_date = ''
    data_arr.each do |val|
      if lowest_temp > (val[3].to_i)
        next unless val[3] && val[3].match?(/\A\d+\z/)
        lowest_temp = val[3].to_i
        lowest_date = val[0]
      end
    end
    display_lowest_temp(lowest_temp, lowest_date)
    # if lowest_date.class.eql?('Date')
  end

  def display_lowest_temp(temp, date)
    date = Date.parse(date)
    formatted_date = date.strftime("%B %e")
    puts "Lowest: #{temp}C on #{formatted_date}"
  end


  def calculate_max_humidity(data_arr)
    highest_humidity =0
    humid_date= ''
    data_arr.each do |val|
      if
        highest_humidity < (val[7].to_i)
        highest_humidity = val[7].to_i
        humid_date = val[0]
      end
    end
    display_highest_humidity(highest_humidity, humid_date)
  end

  def display_highest_humidity( hum , date)
    date = Date.parse(date)
    formatted_date = date.strftime("%B %e")
    puts "Humid: #{hum}% on #{formatted_date}"
  end

  def calculate_avgmax_temp(data_arr)
    avghighest_temp = 0
    avghighest_date = ''
    data_arr.each do |val|
      if
        avghighest_temp < val[2].to_i
        next unless val[2] && val[2].match?(/\A\d+\z/)
        avghighest_temp = val[2].to_i
        avghighest_date = val[0]
      end
    end
    display_avghightest_temp(avghighest_temp, avghighest_date)
  end

  def display_avghightest_temp(temp, date)
    date = Date.parse(date)
    formatted_date = date.strftime("%B %e")
    puts "Highest Average: #{temp}C on #{formatted_date}"
  end

  def calculate_avgmin_temp(data_arr)
    avglowest_temp = 999
    avglowest_date = ''
    data_arr.each do |val|
      if
        avglowest_temp > (val[2].to_i)
        next unless val[2] && val[2].match?(/\A\d+\z/)
        avglowest_temp = val[2].to_i
        avglowest_date = val[0]
      end
    end
      display_avglowest_temp(avglowest_temp, avglowest_date)
  end

  def display_avglowest_temp(temp, date)
    date = Date.parse(date)
    formatted_date = date.strftime("%B %e")
    puts "Lowest Average: #{temp}C on #{formatted_date}"
  end

  def calculate_avgmax_humidity(data_arr)
    avghighest_humidity =0
    avghumid_date= ''
    data_arr.each do |val|
      if
        avghighest_humidity < (val[8].to_i)
        next unless val[8] && val[8].match?(/\A\d+\z/)
        avghighest_humidity = val[8].to_i
        avghumid_date = val[0]
      end
    end
    display_avghighest_humidity(avghighest_humidity, avghumid_date)
  end

  def display_avghighest_humidity( hum , date)
    date = Date.parse(date)
    formatted_date = date.strftime("%B %e")
    puts "Average Humidity: #{hum}% on #{formatted_date}"
  end

  def highest_bar(data_arr, month, year)
    max_temp = 0
    min_temp = 0
    puts "#{month} #{year} \n"
    data_arr.each_with_index do |val, index|
      next if index.eql?(0)
      max_temp = val[1].to_i
      min_temp = val[3].to_i
      next if min_temp.nil? && max_temp.nil?
      index = "0#{index.to_s}" if index < 10
    puts "#{index} #{'+'.red * max_temp.to_i} #{max_temp}C"
    puts "#{index} #{'+'.blue * min_temp.to_i} #{min_temp}C"
      end
  end

end
