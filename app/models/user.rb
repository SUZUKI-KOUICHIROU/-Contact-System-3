class User < ApplicationRecord
  
  has_many :schoolclasses, dependent: :destroy
  has_many :students, dependent: :destroy

  # 「remember_token」という仮想の属性を作成します。
  attr_accessor :remember_token 
  
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 30 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  
  validates :address, length: { maximum: 30 }
  validates :telephone_number, length: { maximum: 15 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  
  # 渡された文字列のハッシュ値を返します。
  def User.digest(string)
    cost = 
      if ActiveModel::SecurePassword.min_cost
        BCrypt::Engine::MIN_COST
      else
        BCrypt::Engine.cost
      end
    BCrypt::Password.create(string, cost: cost)
  end

  # ランダムなトークンを返します。
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # 永続セッションのためハッシュ化したトークンをデータベースに記憶します。
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # トークンがダイジェストと一致すればtrueを返します。
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # ユーザーのログイン情報を破棄します。
  def forget
    update_attribute(:remember_digest, nil)
  end

  # トークンがダイジェストと一致すればtrueを返します。
  def authenticated?(remember_token)
  # ダイジェストが存在しない場合はfalseを返して終了します。
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  AUTH_URI = 'https://access.line.me/oauth2/v2.1/authorize'

  def auth_uri(state)
    params = {
      response_type: 'code',
      client_id: @admin.line_login_id,
      redirect_uri: callback_uri,
      state: state,
      scope: 'openid',
      prompt: 'consent', # 必ずLINE認証を許可するようにするオプション
      bot_prompt: 'aggressive' # ログイン後に連携した公式アカウントと友だちになるか聞く画面を出してくれる
    }

    # NOTE: https://developers.line.biz/ja/docs/line-login/integrate-line-login/#making-an-authorization-request
    "#{AUTH_URI}?#{params.to_query}"
  end

  def line_user_id(code)
    verify_id_token(access_token_data(code))['sub']
  end
  
  def access_token_data(code)
    req_body = {
      grant_type: 'authorization_code',
      code: code,
      redirect_uri: callback_uri, # NOTE: LINEログインのチャネルのコンソールで設定した「コールバックURL」と比較している。
      client_id: @admin.line_login_id,
      client_secret: @admin.line_login_secret
    }
  
    # NOTE: https://developers.line.biz/ja/docs/line-login/integrate-line-login/#get-access-token
    res = conn.post do |req|
      req.url '/oauth2/v2.1/token'
      req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
      req.body = req_body
    end
    JSON.parse(handle_error(res).body)
  end
  
  def verify_id_token(access_token_data)
    req_body = {
      id_token: access_token_data['id_token'],
      client_id: @admin.line_login_id
    }
    # NOTE: https://developers.line.biz/ja/reference/social-api/#verify-id-token
    res = conn.post do |req|
      req.url '/oauth2/v2.1/verify'
      req.body = req_body
    end
    JSON.parse(handle_error(res).body)
  end
end
