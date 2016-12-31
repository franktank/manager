# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
['admin', 'lead', 'member'].each do |role|
  Role.find_or_create_by({name: role})
end

# Assign permissions to each role
p1 = Permission.create(name: "Add Member", description: "Add member to group through invitation")
p2 = Permission.create(name: "Manage Tasks", description: "Create and assign tasks in the project")
p3 = Permission.create(name: "Manage Users", description: "Change roles of users in the group")

# Permissions for admin
RolePermission.create(role: Role.where(name: "admin").first, permission: p1)
RolePermission.create(role: Role.where(name: "admin").first, permission: p2)
RolePermission.create(role: Role.where(name: "admin").first, permission: p3)

# Permissions for lead
RolePermission.create(role: Role.where(name: "lead").first, permission: p2)


# Owner permissions? Check in application if current_user == Group.owner
 # Can change ownership
 # Monitor hours per user
 # Monitor tasks per user
