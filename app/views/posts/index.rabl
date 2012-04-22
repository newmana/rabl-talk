# Declare the data source
collection @posts

# Declare attributes to display
attributes :title, :body

# Add custom node to declare if the post is recent
node :is_recent do |post|
  post.created_at > 1.week.ago
end

# Include user as child node, reusing the User 'show' template
child :user do
  extends "users/show"
end