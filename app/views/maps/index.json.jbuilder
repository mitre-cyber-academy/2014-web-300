json.array!(@maps) do |map|
  json.extract! map, :id, :latitude, :longitude, :zoom, :user_id
  json.url map_url(map, format: :json)
end
