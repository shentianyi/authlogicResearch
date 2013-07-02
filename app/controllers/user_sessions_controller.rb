class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def new
  @user_session= UserSession.new
  end


  def create
    @user_session = UserSession.new(params[:user_session])

    if @user_session.save
      respond_to do |format|
        format.json {render :json =>{:success=>ture,:redirected_to=>redirect_or_default}}
        format.html {
          flash[:notice]='successfully signed in'
          redirect_or_default
        }
      end
    else
      format.json {render :json =>{:success=>false}}
      format.html {
        flash[:alert] = 'wrong username or password'
        render :action => 'new'
      }
    end
  end



  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_user_session_url
  end

end
