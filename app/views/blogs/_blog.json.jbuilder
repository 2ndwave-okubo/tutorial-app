json.extract! blog, :id, :created_at, :updated_at
json.url blog_url(blog, format: :json)
json.array! @blogs do |blog|
  json.title blog.title
  json.content blog.content
  json.name blog.blog.name
end