#!/usr/bin/env ruby
require 'date'
require 'time'

out = ''

def trunc(text, length = 50)
  return text if text.size < length 
  words = text.split(' ');
  trunc = ''
  
  trunc += words.shift + ' ' while trunc.size < length and !words.empty?
  trunc[-1] = '…'
  trunc
end

today = (
  %x{/usr/local/bin/icalBuddy -nc -eep "location, url, notes, datetime" eventsToday}
).
  strip.
  downcase

today.each do |line|
  out << line
end unless today.empty?

now = Date.today
upcomming = (
  %x{/usr/local/bin/icalBuddy -nc -eep "location, url, notes, datetime" eventsFrom:"#{(now+1).strftime("%Y-%m-%d %H:%M:%S -03:00")}" to:"#{(now+4).strftime("%Y-%m-%d %H:%M:%S -03:00")}"}
).
    strip.
    downcase

out << "\nupcomming...\n"
upcomming.each do |line|
  out << trunc( line )
end unless upcomming.empty?

out.gsub!(/due:\s/, '')
puts out
