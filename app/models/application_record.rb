class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # Rails.application.config.active_record.belongs_to_required_by_default = false
end
