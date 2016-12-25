module Mydevise
  class RegistrationsController < Devise::RegistrationsController
    def new
      build_resource({})
      yield resource if block_given? # Do I need ths?
      self.resource.groups.build
      respond_with self.resource
    end

    def create
      super
      resource_group = self.resource.groups.first
      resource_group.owner_id = resource.id
      resource_group.save
    end
  end
end
