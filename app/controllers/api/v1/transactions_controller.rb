class Api::V1::TransactionsController < ApplicationController
  def index
    dates = resource_params[:from]..resource_params[:to]
    transactions = []

    Transaction.where(published_at: dates).order(:published_at).each do |t|
      transactions.push(t)
    end

    render json: transactions.to_json
  end

  def create
    resource = Transaction.create(resource_params)

    if resource.valid?
      render json: resource.to_json, status: :created
    else
      render json: resource.errors.to_json, status: :unprocessable_entity
    end
  end

  def destroy
    Transaction.find(params[:id]).destroy
    render json: { message: "done" }, status: :ok
  end

  def update
    resource = Transaction.find(params[:id])

    if resource.update(resource_params)
      render json: resource.to_json, status: :updated
    else
      render json: resource.errors.to_json, status: :unprocessable_entity
    end
  end

  protected

  def resource_params
    params.permit(:published_at, :sum, :direction, :category_id, :from, :to)
  end
end
