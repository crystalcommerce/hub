class StoresController < ApplicationController
  def index
    @stores = Store.page params[:page]
  end
end
