# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


def delete_all_roles
 Role.delete_all
end
def create_all_roles
 Role.create({name: 'admin', description: 'only joel'})
 Role.create({name: 'manager', description: 'only paola and monique'})
end
def delete_all_users
 User.delete_all
end
def create_all_users
 admin = Role.find_by_name 'admin'
 manager = Role.find_by_name 'manager'
 User.create({username: 'joel', email: 'joel@unidoinoakland.com', 
  active: true, role_id: admin.id, password: 'password', password_confirmation: 'password'})
 User.create({username: 'paola', email: 'paola@unidoinoakland.com', 
  active: true, role_id: manager.id, password: 'password', password_confirmation: 'password'})
 User.create({username: 'monique', email: 'monique@unidoinoakland.com', 
  active: true, role_id: manager.id, password: 'password', password_confirmation: 'password'})
end

puts "---> hi. im seed.rb. lets start"

delete_all_roles
create_all_roles
delete_all_users
create_all_users

puts "---> all done."
#Fabric.delete_all
#Fabric.create(name: "camouflage,gray and black stripes- jersey? uNido or Pao's")
#Fabric.create(name: "green for nathan ,turquoise jersey- uNido or Pao's")
#Fabric.create(name: "yellow")
#Fabric.create(name: "orange")
#Fabric.create(name: "blue with flowers for nathan ")
#Fabric.create(name: "gray speckles")
#Fabric.create(name: "sage with holes")
#Fabric.create(name: "navy blue light knit")
#Fabric.create(name: "slinky stripes for nathan")
#Fabric.create(name: "white beater stripes- red")
#Fabric.create(name: "gray argyle")
#Fabric.create(name: "bird wool")
#Fabric.create(name: "black and white birds")
#Fabric.create(name: "black and white swirls")
#Fabric.create(name: "traditional plaid flannel")
#Fabric.create(name: "army green and black light knit")
#Fabric.create(name: "thick striped colores- light jersey")
