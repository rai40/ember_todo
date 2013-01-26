class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :is_done, :minutes_estimated_to_complete, :list_id
end
