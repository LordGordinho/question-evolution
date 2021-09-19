class Api::V1::OptionsController < ApplicationController
  def show
  end

  def create
    option = Option.new(option_params)

    if option.save
      render json: {option: option}, code: :created
    else
      render json: {errors: option.errors }, code: 406
    end
  end

  def destroy
  end

  private

  def option_params
    params.permit(:content, :correct_option)
  end
end
