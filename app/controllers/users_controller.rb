class UsersController < ApplicationController
  def new
    @user = User.new
  end


  def create
    @user = User.new(params[:user])
    # Saving without session maintenance to skip
    # auto-login which can't happen here because
    # the User has not yet been activated


     begin
       ActiveRecord::Base.transaction do
         @user.save!

       end
       flash[:notice] = "Your account has been created."
       render :action=>'show'
     rescue ActiveRecord::RecordInvalid => invalid
           render_internal_error_page
     end
  end



  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"

    else
      render :action => :edit
    end
  end




end
