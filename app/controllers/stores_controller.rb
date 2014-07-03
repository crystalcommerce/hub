class StoresController < ApplicationController
  def index
    @stores = if params[:store_name] && !params[:store_name].blank?
       Store.where(database_name: params[:store_name]).order(:database_name).page(params[:page])
    else
       Store.page(params[:page]).order(:database_name)
    end
  end
end
