class FilesController < ApplicationController
  def index
    render json: User.new.files
  end

  def show
    render json: User.new.file(params[:id])
  end

  def contents
    file = User.new.file params[:id]
  end
end
