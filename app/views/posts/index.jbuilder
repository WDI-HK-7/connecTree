json.array! @posts do |post|
  json.id         post.id 
  json.picture    post.picture
  json.caption    post.caption 
  json.title      post.title
  json.created_at post.created_at
  json.user_name  post.user.name
end 

