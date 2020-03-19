json.extract! survey, :id, :public, :creationDate, :expiryDate, :likes, :dislikes, :created_at, :updated_at
json.url survey_url(survey, format: :json)
