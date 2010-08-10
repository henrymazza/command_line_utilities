%x(syslog -F '$Time $Message' -k Sender /System/Library/CoreServices/backupd -k Time ge -15m | tail -n 3).each do |line|
  if line.size > 120
    puts line[20..100] + "..."
  else
    puts line[20..line.size]
  end
end
