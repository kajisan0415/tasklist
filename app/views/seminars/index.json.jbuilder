json.array!(@seminars) do |seminar|
  json.extract! seminar, :id, :title
  json.start seminar.starts_at
  json.end seminar.ends_at
  json.url seminar_url(seminar, format: :html)
end

json.array!(@post_comments) do |comment|
  json.extract! comment, :id, :comment
  json.title comment.report
  json.start comment.created_at
end
