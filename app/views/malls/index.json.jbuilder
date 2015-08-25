json.array!(@malls) do |mall|
  json.extract! mall, :id, :name, :open, :close, :address
  json.url mall_url(mall, format: :json)
end
