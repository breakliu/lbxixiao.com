json.array!(@top_links) do |top_link|
  json.extract! top_link, :title, :href
  json.url top_link_url(top_link, format: :json)
end
