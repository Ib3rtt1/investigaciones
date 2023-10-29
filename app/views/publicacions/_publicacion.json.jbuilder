json.extract! publicacion, :id, :name, :date, :title, :resume, :created_at, :updated_at
json.url publicacion_url(publicacion, format: :json)
