class Consumers::SessionsController < Devise::SessionsController
  #before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    consumer_path(resource)
  end

  def after_sign_out_path_for(resource)
    about_path
  end
  
  private
  
  def reject_consumers
    @consumers = Consumers.find_by(email: params[:consumers][:email])
    if @consumer#上の行でconsumerが見つかった場合
      if @consumers.valid_password?(params[:consumers][:password]) && (@consumers.is_active == false)
        #@consumerで取得したアカウントのパスワードがログイン画面の入力されたパスワードと一致しているか(valid_password)、会員が退会済みか↑
        flash[:notice] = "退会済みです。再度登録してください"
        redirect_to new_consumer_session_path
      else
        flash[:notice] = "項目を入力してください"
      end
    else
      flash[:notice] = "該当するユーザーが見つかりません"#if @consumerでアカウントが見つからなかった場合
    end
  end
  

  #def configure_permitted_parameters
  #  devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  #end
end