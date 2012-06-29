require 'rubygems'
require 'json'
require 'jsonschema'

schema = File.open("schema.json",    "rb"){|f| JSON.parse(f.read)}
data   = File.open("data/tlds.json", "rb"){|f| JSON.parse(f.read)}

if JSON::Schema.validate(data, schema)
	puts "tlds.json is valid.\n"
else
	puts "tlds.json is NOT valid.\n"
end
