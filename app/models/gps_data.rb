class GpsData < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  enum status: { built: 0, created: 1, processed: 2 }
  validates :file_location, presence: true
  validates :status, presence: true

  VALID_TYPES = %w(application/gpx+xml) # application/vnd.garmin.tcx+xml application/vnd.google-earth.kmz text/csv

  def initialize(params)
    temp = params.delete(:file)
    super(params)
    self.file_location = store_data(temp)
  end

  def store_data(iostream)
    path = Rails.root.join('uploads', event.id.to_s, user.id.to_s, 'uploads')
    FileUtils.mkdir_p path
    File.open(File.join(path, iostream.original_filename), 'wb') do |file|
      file.write(iostream.read)
    end
    path.to_s
  end

  def process_data
    parser = GpsxParser.new(file_location)
    @data = parser.extract_gps_coords.to_json
    self.processed!
    self.save!
  end

  def self.acceptable_types
    VALID_TYPES.join(',')
  end
end
