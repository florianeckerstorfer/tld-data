require 'rubygems'
require 'json'
require 'jsonschema'

schema     = File.open("schema.json", "rb"){|f| JSON.parse(f.read)}
dataGTlds  = File.open("gtlds.json",  "rb"){|f| JSON.parse(f.read)}
dataCcTlds = File.open("cctlds.json", "rb"){|f| JSON.parse(f.read)}

if JSON::Schema.validate(dataGTlds, schema)
	puts "gtlds.json is valid.\n"
else
	puts "gtlds.json is NOT valid.\n"
end

if JSON::Schema.validate(dataCcTlds, schema)
	puts "cctlds.json is valid.\n"
else
	puts "cctlds.json is NOT valid.\n"
end
