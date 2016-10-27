class ProfilesController < ApplicationController
  def index
    render json: Profile.all
  end

  def show
    render json: profile
  end

  def create
    Profile.create params.permit(:first_name, :last_name, :phone)
    head :created
  end

  private

  def profile
    @profile ||= Profile.find_by params[:id]
  end
end
