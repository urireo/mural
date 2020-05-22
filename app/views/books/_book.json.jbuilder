json.extract! book, :id, :caption, :comment, :user_id, :segment_id, :created_at, :updated_at
json.url book_url(book, format: :json)
