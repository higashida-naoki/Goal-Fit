class AdminSide::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
  end
end
