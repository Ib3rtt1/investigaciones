json.extract! investigacion, :id, :name, :date, :title, :resume, :created_at, :updated_at
json.url investigacion_url(investigacion, format: :json)
