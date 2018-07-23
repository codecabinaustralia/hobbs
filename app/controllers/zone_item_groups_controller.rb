class ZoneItemGroupsController < ApplicationController
  def zone_groups
  	@zone_group = ZoneItemGroup.new(
  					project_id: params[:project],
  					zone_id: params[:zone],
  					item_group_id: params[:group]
  					)
  	@zone_group.save!
    redirect_to project_path(params[:project])
  end

  def delete_zone_group
  	@zone_item_group = ZoneItemGroup.find(params[:zone_group_id])
    @zone_item_group.delete
   

    redirect_to project_path(@zone_item_group.project_id)
  end

end
