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

  def show
    render json: Category.find(params[:id])
  end

  def destroy
    resource = Category.find(params[:id])
    resource.destroy

    render json: { status: resource.destroyed? }, status: :ok
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
    params.permit(:name, :page, :per_page, :id)
  end
end
