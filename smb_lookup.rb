# /usr/bin/ruby
# 

# 140.upto(142) do |ip|
#   if system "smbutil status 172.22.1.#{ip}" 
#     puts $?
#   else
#     puts $?
#   end
# end

ans = system 'ping -c 1 172.22.1.141'

if ans
  puts "ok"
end