class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
#基本的に外部からは隠蔽するが、サブクラスやパッケージ内からのみ利用させたい場合しようする。
#ここでprivateを使用してしまうとこのコントローラーないでしか使用できず、ほかクラスからデータを持ってくることができない。

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
