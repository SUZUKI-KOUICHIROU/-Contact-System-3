uri = URI.parse("https://api.line.me/oauth2/v2.1/token")
request = Net::HTTP::Post.new(uri)
request.content_type = "application/x-www-form-urlencoded"
request.set_form_data(
  "client_id" => "1657280915",
  "client_secret" => "state",
  "code" => params[:code],
  "grant_type" => "authorization_code",
  "redirect_uri" => "http://localhost:8000/line_logins",
)

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end