%x(find ./ -name "#{ARGV[0]}").each do |file|
  file = File.expand_path(file)
  input = file
  output = file.match(/(.*)\..*$/)[1] + ".mp4"
  
  %x(HandBrakeCLI -i "#{input.strip}" -o "#{output.strip}" -e x264 -q 0.589999973773956 -a 1 -E faac -B 128 -R 48 -6 dpl2 -f mp4 -X 640 -m -x level=30:cabac=0:ref=2:mixed-refs:analyse=all:me=umh:no-fast-pskip=1) + "\n\n\n"
end