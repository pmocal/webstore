class TagsController < ApplicationController
	
	before_action :require_login, only: [:destroy]

	def index
		@tags = Tag.all
	end

	def show
		@tag = Tag.find_by(name: params[:name])
	end

	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy

		flash.notice = "Tag '#{@tag}' Deleted!"

		redirect_to tags_path
	end
end