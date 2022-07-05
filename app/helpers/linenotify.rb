  require 'net/http'
  require 'uri' 
  
  class LineNotify < ApplicationController
    
    def self.user
      user = User.where(teacher: true)
    end

    TOKEN = "token".freeze
    URL = 'https://notify-api.line.me/api/notify'.freeze
    debugger
    attr_reader :message

    def self.class_board(message)
      new(message).class_board
    end
  
    def initialize(message)
      @message = message
    end
  
    def class_board
      Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |https|
        https.request(request)
      end
    end
  
    private
  
    def request
      request = Net::HTTP::Post.new(uri)
      request['Authorization'] = "Bearer #{TOKEN}"
      request.set_form_data(message: message)
      request
    end
  
    def uri
      URI.parse(URL)
    end
  end