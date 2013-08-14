json.data do 
  json.array!(@posts) do |post|
    json.text post.title
    json.img 'http://b.zol-img.com.cn/desk/bizhi/image/2/144x90/1360978011487.jpg'
  end
end