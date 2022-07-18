AUTH_URI = 'https://access.line.me/oauth2/v2.1/authorize'

def auth_uri(state)
  params = {
    response_type: 'code',
    client_id: "1657280915",
    redirect_uri: "https://arcane-peak-28945.herokuapp.com",
    state: state,
    scope: 'openid%20email',
    prompt: 'consent', # 必ずLINE認証を許可するようにするオプション
    bot_prompt: 'aggressive' # ログイン後に連携した公式アカウントと友だちになるか聞く画面を出してくれる
  }

  # NOTE: https://developers.line.biz/ja/docs/line-login/integrate-line-login/#making-an-authorization-request
  "#{AUTH_URI}?#{params.to_query}"
end