json.extract! question_answer, :id, :question_id, :user_id, :givenAnswer, :timeStarted, :timeEnded, :created_at, :updated_at
json.url question_answer_url(question_answer, format: :json)
