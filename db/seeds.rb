# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
