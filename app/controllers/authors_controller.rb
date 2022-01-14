class AuthorsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response


  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    author = Author.create!(author_params)
    # if author.valid?
    render json: author, status: :created
    # else
    #   render json: { errors: author.errors }, status: :unprocessable_entity
    #   end
    # render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end

  private
  
  def author_params
    params.permit(:email, :name)
  end
  

  private
  def render_unprocessable_entity_response(invalid)
    # byebug
      render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end
end
