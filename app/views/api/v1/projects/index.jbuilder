json.(@projects) do |project|
  json.(project,
      :status,
      :zipcode,
      :description,
      :created_at,
      :updated_at,
      :recurring,
      :timeline,
      :requester_id,
      :latitude,
      :longitude,
      :service_id
      )
end