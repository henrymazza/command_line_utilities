require 'rubygems'
require 'active_support'

last_date = DateTime.parse(%x(/bin/cat /private/var/db/.TimeMachine.Results.plist | grep date))

days = (DateTime.now - last_date).to_i

puts days.to_s + " days since last backup" unless days == 0

