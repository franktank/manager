module Api
  class GroupsController < ApplicationController
    def create
      @group = Group.create(group_params)
      render json: @group
    end

    private

    def group_params
      params.require(:group).permit(:name)
    end
  end
end
