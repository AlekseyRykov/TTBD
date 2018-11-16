json.extract! task, :id, :project_id, :description, :date, :time, :priority, :created_at, :updated_at
json.url task_url(task, format: :json)
