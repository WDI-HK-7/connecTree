json.array! @posts do |post|
  json.id      post.id 
  json.caption post.caption 
  json.title   post.title
end 

