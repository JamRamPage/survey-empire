json.extract! question, :id, :survey_id, :questionString, :multipleChoice, :multipleAnswer, :created_at, :updated_at
json.url question_url(question, format: :json)
