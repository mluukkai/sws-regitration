json.extract! application, :id, :firstname, :surename, :street, :zip, :city, :phone, :email, :born, :family, :created_at, :updated_at
json.url application_url(application, format: :json)