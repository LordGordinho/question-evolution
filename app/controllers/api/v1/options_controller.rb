class Api::V1::OptionsController < ApplicationController
  def index
    options = Option.all

    render json: { options: options }, code: 200
  end

  def show
    option = Option.find_by(params[:id])

    if option
      render json: { option: option }, code: :ok
    else
      render json: { errors: 'option not found'}, code: 404
    end
  end

  def create
    option = Option.new(option_params)

    if option.save
      render json: {option: option}, code: :created
    else
      render json: {errors: option.errors }, code: 406
    end
  end

  def update
    option = Option.find_by(id: params[:id])

    if option.update(option_params)
      render json: {option: option}, code: 200
    else
      render json: {errors: option.errors }, code: 406
    end
  end

  def destroy
    option = Option.find_by(id: params[:id])

    render json: {}, code: 200 if option.destroy

    render json: { errors: option.errors}, code: 503
  end

  private

  def option_params
    params.permit(:content, :correct_option)
  end
end
