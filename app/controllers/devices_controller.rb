class DevicesController < ApplicationController
  def update
    render json: { box: { access_token: User.new.client.access_token, expires_at: 1.hour.from_now.to_i } }
  end
end
