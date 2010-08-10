#!/usr/bin/env ruby
#

# Bother me only if it's off the wall
# exit if(`ioreg -n AppleSmartBattery | grep ExternalConnected | awk '{ print $5 }'`.strip == "Yes")

class PowerStatus
  def initialize
    properties = %w(ExternalConnected IsCharging TimeRemaining MaxCapacity CurrentCapacity InstantAmperage)
    @status = `ioreg -n AppleSmartBattery | grep '\\(#{properties.join('\\|')}\\)'`
    @cb = @status.match(/CurrentCapacity\D+(\d+)$/)[1].to_i # maximum capacity
    @mb = @status.match(/MaxCapacity\D+(\d+)$/)[1].to_i # maximum capacity
    @timeR = @status.match(/TimeRemaining\D+(\d+)$/)[1].to_i # time remaining on battery
    # convert's the 2 complement (I think) number to integer
    instant_amperage = @status.match(/InstantAmperage\D+(\d+)$/)[1]
    @amp = `expr #{instant_amperage} + 0`.strip
  end
  def isConnected?
    @conn ||= @status.match(/ExternalConnected.*(Yes|No)$/)[1]
    @conn == "Yes" 
  end
  def getTimeRemaining
    @timeR
  end
  def isCharging?
    @chrg = @status.match(/IsCharging.*(Yes|No)$/)[1] # is battery chargin
    @chrg == "Yes"
  end
  def getMaxCapacity
    @mb
  end
  def getCurrentCapacity
    @cb
  end
  def getPercent
    @cb.to_f / @mb.to_f
  end
  def battery_meter
    meter = ""
    size = 60
    charged = (size*getPercent).to_i

    charged.times do
      meter << "|"
    end
    (size - charged).times do
      meter << " "
    end
    meter << sprintf(" %.0f%", getPercent * 100)
    return meter
  end

  def battery_time
    hour = getTimeRemaining / 60 # hours left
    min = @timeR - (hour * 60) # minutes left
    min < 10 ? min = "0#{min}" : min = min # make sure minutes is two digits long

    return "#{hour}:#{min}"
  end
  def getAmperage
    @amp
  end
end

p = PowerStatus.new

puts "#{p.battery_meter} (#{p.battery_time})\n#{p.getAmperage}mA" unless p.isConnected? and !p.isCharging?

