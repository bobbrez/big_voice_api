class DirectoriesController < ApplicationController
  def index
    render json: User.new.directories
  end

  def show
    render json: User.new.directory(params[:id])
  end

  def contents
    file = User.new.file params[:id]
  end
end

