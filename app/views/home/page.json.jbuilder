json.data do 
  json.array!(@posts) do |post|
    json.text post.title
    json.img post.image.thumb3.url
    json.url post.image.url
  end
end