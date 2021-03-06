class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:destroy,:show]

  def show
    @session = session

  end

  def new
  @user_session= UserSession.new

  end


  def create
    @user_session = UserSession.new(params[:user_session])

    if @user_session.save

          flash[:notice]='successfully signed in'
          session[:currentUser] =  current_user
           redirect_to '/UserSessions/show'

    else

        flash[:alert] = 'wrong username or password'
        render :action => 'new'


    end

  end



  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"

    redirect_to :action=> 'new'
  end

end
