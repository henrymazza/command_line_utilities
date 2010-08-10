%x(ls *.bmp).each do |file|
  %x(convert #{file.strip} -resize 640x480^ -gravity center -extent 640x480 resized_#{file.strip[0..-6]}.jpg)
end