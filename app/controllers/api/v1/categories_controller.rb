class Api::V1::CategoriesController < ApplicationController
  def index
    render json: Category.order(:name).to_json
  end

  def create
    resource = Category.create(resource_params)

    if resource.valid?
      render json: resource.to_json, status: :created
    else
      render json: resource.errors.to_json, status: :unprocessable_entity
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    render json: { message: "done" }, status: :ok
  end

  def update
    resource = Category.find(params[:id])

    if resource.update(resource_params)
      render json: resource.to_json, status: :updated
    else
      render json: resource.errors.to_json, status: :unprocessable_entity
    end
  end

  protected

  def resource_params
    params.permit(:name, :page, :per_page)
  end
end
