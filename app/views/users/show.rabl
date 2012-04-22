object @user

# Declare the properties to include
attributes :first_name, :last_name

# Alias 'age' to 'years_old'
attributes :age => :years_old

# Include a custom node with full_name for user
node :full_name do |user|
  [user.first_name, user.last_name].join(" ")
end

# Include a custom node related to if the user can drink
node :can_drink do |user|
  user.age >= 18
end