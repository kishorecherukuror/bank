# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

branches = [[ "jubilee hills","HDFC0001643"],
[ "banjara hills","HDFC0001643"],
[ "erragadda","HDFC0002245"],
[ "kphb","HDFC0002270"],
[ "kukatpally","HDFC0002288"],
[ "krishna nagar","HDFC0004313"],
[ "ameerpet","HDFC0000050"],
[ "sr nagar","HDFC0000109"],
[ "manikonda","HDFC0001643"],
[ "amberpet","HDFC0001143"]]
#Branch.delete_all
branches.each do |branch|
	Branch.find_or_create_by(area: branch[0], ifsc: branch[1])
end


