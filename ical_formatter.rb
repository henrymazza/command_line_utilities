require 'date'
require 'time'

def trunc(text, length = 50)
  return text if text.size < length 
  words = text.split(' ');
  trunc = ''
  
  trunc += words.shift + ' ' while trunc.size < length and !words.empty?
  trunc[-1] = '…'
  trunc
end

today = (
  %x{/usr/local/bin/icalBuddy -nc -etp "url, notes, datetime, priority" uncompletedTasks} +
  %x{/usr/local/bin/icalBuddy -nc -eep "location, url, notes, datetime" eventsToday}
).
  gsub(/open [for|and].*$|www.*$|by:.*$/, ''). 
  strip!.
  downcase

(today + "\n").each do |line|
  puts line
end unless today.empty?

now = Date.today
upcomming = (
  %x{/usr/local/bin/icalBuddy -ec "Football Cup 2010" -nc -eep "location, url, notes, datetime" eventsFrom:"#{(now+1).strftime("%Y-%m-%d %H:%M:%S -03:00")}" to:"#{(now+4).strftime("%Y-%m-%d %H:%M:%S -03:00")}"}
).gsub("*", "-").strip.downcase

("\nupcoming…\n" + upcomming).each do |line|
  puts trunc line
end unless upcomming.empty?