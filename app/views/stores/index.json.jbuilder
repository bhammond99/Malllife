json.array!(@stores) do |store|
  json.extract! store, :id, :name, :category, :sales
  json.url store_url(store, format: :json)
end
