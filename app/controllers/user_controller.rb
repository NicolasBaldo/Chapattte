class UserController < ApplicationController
  #before_action :authenticate_user!

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def create
    @user = User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: "#{first_name}.#{last_name}@yopmail.com"
    )

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = current_user
  end

  def delete
  end
end
