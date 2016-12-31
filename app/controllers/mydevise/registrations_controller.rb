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
      resource_group.owner = resource
      resource_group.save
      m = resource.memberships.where(group: resource_group).first
      m.role = Role.where(name: "admin").first
      m.save
    end
  end
end
