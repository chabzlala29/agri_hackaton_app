class TagsController < ApplicationController
  def create
    @tag = Tag.new
    @tag.name = tag_params[:name].downcase.gsub(" ", "-")
    @tags = Tag.all
    @helper = ''
    if @tag.save
      @tags.each do |tag|
        @helper << "<option value='#{tag.id}'>#{tag.name}</option>"
      end
    else
      render js: "alert('Check name brother')"
    end 
  end

  private
  def tag_params
    params.require(:tag).permit!
  end
end
