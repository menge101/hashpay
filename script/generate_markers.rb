#!/Users/nmenge/.rvm/rubies/ruby-2.2.0/bin/ruby
require 'color'

def replace_color(source_file_path, dest_file_path, replacement_color, original_color='ffffff')
  text = File.read(source_file_path)
  File.open(dest_file_path, 'w') do |file|
    file.puts(text.gsub(Regexp.new(original_color), replacement_color))
  end
end

# This method calls out to inkscape to generate a png marker from the svg file
# Inkscape must be installed for this to succeed
def generate_png(source_file, destination_file)
  `inkscape -f #{source_file} -w 30 -h 42 -e #{destination_file}`
end

(0..210).each do |hue|
  current_color = Color::HSL.new(hue,100,50)
  replace_color('design_files/onon_marker.svg', 'temp.svg', current_color.to_rgb.hex)
  generate_png('temp.svg', "public/images/markers/onon_marker_#{hue}.png")
  File.delete('temp.svg')
end