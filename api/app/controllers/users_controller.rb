class UsersController < ApplicationController
  before_action :auth_user, :load_user, except: %i[create]
  authorize_resource except: %i[create]

  def show
    render json: @user.to_json(except: %i[password_digest])
  end

  def update
    @user.update(update_user_params)
    if @user.errors.blank?
      render status: :ok
    else
      render json: @user.errors, status: :bad_request
    end
  end

  def create
    @user = User.create(create_user_params)
    if @user.errors.blank?
      render json: @user, except: %i[password_digest], status: :ok
    else
      render json: @user.errors, status: :bad_request
    end
  end

  protected

  def load_user
    @user = current_user
  end

  def default_user_fields
    %i[name]
  end

  def update_user_params
    params.required(:user).permit(
      *default_user_fields, :password
    )
  end

  def create_user_params
    params.required(:user).permit(
      *default_user_fields, :email, :password
    )
  end
end
