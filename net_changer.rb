#!/usr/bin/env ruby

sleep(3)

message = ""

Locations = {
  "Wi-Aki" => 'Akivest', 
  "Wi-Mazza" => "HomeSweetHome",
  "WiMazza" => "HomeSweetHome" 
}

wifi = %x(system_profiler SPAirPortDataType).split("\n").each{ |line| line.lstrip! }
wifi_i = wifi.find_index("Current Network Information:")
wifi_name = wifi[wifi_i + 1].chop
puts wifi_name

if system %(/usr/sbin/scselect #{Locations[wifi_name]})
  message = "Alterando localização: #{Locations[wifi_name]}"
else
  message = "Houve um erro ao alterar localização: #{$?}"
end  
  
system %(/usr/local/bin//growlnotify "NetChanger Daemon" -n "NetChanger Daemon" -m "#{message}" --image /Users/HMz/bin/airpot.png) 
