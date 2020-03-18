json.extract! survey, :id, :belongs_to, :public, :creationDate, :expiryDate, :likes, :dislikes, :created_at, :updated_at
json.url survey_url(survey, format: :json)
