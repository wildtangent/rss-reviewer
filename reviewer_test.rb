#!/usr/bin/ruby
require 'rubygems'

require 'eventmachine'
require "gpio"
require "net/http"
require "uri"
require 'date'
require 'time'

#GPIO27 - green
#GPIO7 - red
#GPIO23 - yellow

#GPIO14 - yellow
#GPIO18 - red
#GPIO8 - green

@green1 = GPIO::Led.new(pin:10)
@red1 = GPIO::Led.new(pin:15)
@yellow1 = GPIO::Led.new(pin:22)

@green2 = GPIO::Led.new(pin:27)
@red2 = GPIO::Led.new(pin:7)
@yellow2 = GPIO::Led.new(pin:23)

@green3 = GPIO::Led.new(pin:14)
@red3 = GPIO::Led.new(pin:18)
@yellow3 = GPIO::Led.new(pin:8)

@led_set_1 = {:red => @red1, :green => @green1, :yellow => @yellow1}
@led_set_2 = {:red => @red2, :green => @green2, :yellow => @yellow2}
@led_set_3 = {:red => @red3, :green => @green3, :yellow => @yellow3}
def red_on(led_hash)
  led_hash[:red].on
  led_hash[:green].off
  led_hash[:yellow].off
end
def green_on(led_hash)
  led_hash[:red].off
  led_hash[:green].on
  led_hash[:yellow].off
end

def yellow_on(led_hash)
  led_hash[:red].off
  led_hash[:green].off
  led_hash[:yellow].on
end
def change_led_status(status,led_hash)
  case status
  when 1
    green_on(led_hash)
  when 2
    yellow_on(led_hash)
  when 3
    red_on(led_hash)
  end
#def read_rss_feed(address)
#  doc = Nokogiri::HTML(open(address))
#end

#def is_today?(date)
#  date.to_date === DateTime.now.to_date
#end

#def count_num_of_entries_today(address)
#  count = 0
#  read_rss_feed(address).xpath("//item").each do |item|
#    date = Date.rfc2822(item.xpath("pubdate").first.text)
#      if is_today? date
#        count +=1
#      end
#    end
#    count
#end  
#def addresses_sorted_by_num_entries(address_array)
#  address_array.sort_by {|address| count_num_of_entries_today(address)}
##end
#@sorted_addresses = addresses_sorted_by_num_entries(["http://dirt.mpora.com/feed","http://roadcyclinguk.com/feed","http://bikemagic.com/feed"])
#@dirt_index = @sorted_addresses.find_index("http://dirt.mpora.com/feed")
#@RCUK_index = @sorted_addresses.find_index("http://roadcyclinguk.com/feed")
#@bike_magic_index = @sorted_addresses.find_index("http://bikemagic.com/feed")
change_led_status(0,@led_set_1)
change_led_status(1,@led_set_2)
change_led_status(2,@led_set_3)





