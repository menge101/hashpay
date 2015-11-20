require 'nokogiri'

class GpsxParser
  attr_reader :coordinates

  FILE_LOCATION = 'uploads'

  def initialize(file_name)
    @file = Nokogiri::XML(File.open(Rails.root.join(FILE_LOCATION, file_name), 'rb'))
    @coordinates = Array.new
  end

  def extract_gps_coords
    @file.css('trkpt').each { |x| ordered_insert({ latitude: x.attr('lat').to_s, longitude: x.attr('lon').to_s }) }
    @coordinates
  end

  # This method should insert to the coordinate array, maintaining the list as a sorted one
  def ordered_insert(value)
    if @coordinates.empty?
      @coordinates << value
    else
      idx = @coordinates.find_index { |x| x[:latitude] > value[:latitude] && x[:longitude] > value[:longitude] }
      if idx.nil?
        @coordinates << value
      else
        temp = @coordinates.slice!(idx, @coordinates.length - idx)
        @coordinates << value
        @coordinates.concat temp
      end
    end
  end
end