class MembersController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: { message: 'logged in' }
  end
end
