# config/initializers/load_zip_codes.rb
ZipCodes.load unless Rails.env.production? || Rails.env.development?