require 'rubygems'
require 'json'
require 'jsonschema'

schema     = File.open("schema.json",  "rb"){|f| JSON.parse(f.read)}
dataGTlds  = File.open("data/g.json",  "rb"){|f| JSON.parse(f.read)}
dataCcTlds = File.open("data/cc.json", "rb"){|f| JSON.parse(f.read)}

if JSON::Schema.validate(dataGTlds, schema)
	puts "g.json is valid.\n"
else
	puts "g.json is NOT valid.\n"
end

if JSON::Schema.validate(dataCcTlds, schema)
	puts "cc.json is valid.\n"
else
	puts "cc.json is NOT valid.\n"
end
