class Api::V1::Reports::ByAuthorController < ApplicationController
  def index
    h = {
      start_date: resource_params[:start_date],
      end_date:   resource_params[:end_date],
      email:      resource_params[:email]
    }

    report = Report.new(h)

    if report.valid?
      render json: { message: 'Report generation started' }, status: :created
      MakeReportJob.perform_later(h)
    else
      render json: report.errors.to_json, status: :unprocessable_entity
    end

  end

  protected

  def resource_params
    params.permit(:start_date, :end_date, :email)
  end
end
