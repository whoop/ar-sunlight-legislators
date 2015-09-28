require 'csv'
require_relative '../app/models/legislator'

class SunlightLegislatorsImporter
  def self.import(filename)
    attributes_array = Legislator.columns.map(&:name)
    csv = CSV.new(File.open(filename), :headers => true)
    csv.each do |row|
      cleaned_row = row.to_hash.delete_if{ |key, value| attributes_array.include?(key) == false }.symbolize_keys!
      cleaned_row[:firstname].strip! unless cleaned_row[:firstname] == nil
      cleaned_row[:lastname].strip! unless cleaned_row[:lastname] == nil
      cleaned_row[:middlename].strip! unless cleaned_row[:middlename] == nil
      cleaned_row[:phone].gsub!("-","")
      cleaned_row[:fax].gsub!("-","")
      formatted_birthdate = cleaned_row[:birthdate].gsub!(/\//,"-")
      cleaned_row[:birthdate] = Date.strptime(formatted_birthdate, '%m-%d-%Y')
      legislator = Legislator.create!( cleaned_row )
    end
  end
end

# IF YOU WANT TO HAVE THIS FILE RUN ON ITS OWN AND NOT BE IN THE RAKEFILE, UNCOMMENT THE BELOW
# AND RUN THIS FILE FROM THE COMMAND LINE WITH THE PROPER ARGUMENT.
# begin
#   raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
#   SunlightLegislatorsImporter.import(ARGV[0])
# rescue ArgumentError => e
#   $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
# rescue NotImplementedError => e
#   $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
# end
