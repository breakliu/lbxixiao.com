json.array!(@ctypes) do |ctype|
  json.extract! ctype, :title
  json.url ctype_url(ctype, format: :json)
end
