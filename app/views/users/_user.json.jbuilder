json.extract! user, :id, :fname, :lname, :ful_name, :email, :age, :address, :gender, :created_at, :updated_at
json.url user_url(user, format: :json)