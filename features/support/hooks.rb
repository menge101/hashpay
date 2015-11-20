Before do
  register_geocoder
  DatabaseCleaner.start
end

After do
  DatabaseCleaner.clean
end