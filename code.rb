require 'date'
require 'colorize'
require './calculate'

class Weatherman

  include Calculations

  def yearly_file_read
    year = ARGV[1]
    data = file_reading("*_#{year}_*.txt")
    calculate_max_temp(data)
    calculate_min_temp(data)
    calculate_max_humidity(data)
  end

  def month_year
    year = (ARGV[1].split('/'))[0]
    month = ((ARGV[1].split('/'))[1])
    month = Date::ABBR_MONTHNAMES[month.to_i]
    pattern= file_reading("*_#{year}_#{month}.txt")
    highest_bar(pattern, month, year) if ARGV[0] =='-c'
    month_year_average(pattern) if ARGV[0] =='-a'
  end

  def month_year_average(pattern)
    calculate_avgmax_temp(pattern)
    calculate_avgmin_temp(pattern)
    calculate_avgmax_humidity(pattern)
  end

  def file_reading(file_pattern)
    data_arr = []
    Dir.chdir ARGV[2]
    Dir.glob file_pattern do |file|
      File.readlines(file).each do |line|
        data_arr << line.split(',')
      end
    end
    data_arr
  end

  def select_mode
    if ARGV[0] == '-e'
      yearly_file_read
    elsif ARGV[0] =='-a'
      month_year
    elsif ARGV[0] =='-c'
      month_year
    else
      puts "unavailable"
    end
  end
end

my_app_object = Weatherman.new
my_app_object.select_mode

