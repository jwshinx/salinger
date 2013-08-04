class OpenWeatherMapService
  include HTTParty                    
  include Formatable
                   
  attr_reader :body, :city, :temperature, :temperature_date, :response_code, :message_code, :content_type, :date, :server, :transfer_encoding, :connection
  def initialize(url)
    response = HTTParty.get(url) 
    raise "Sorry, something unexpected happened." unless response.response.instance_of? Net::HTTPOK
    attributes = JSON.parse(response.body) 
    @response_code = response.code.to_s
    @message_code = attributes['cod']
    raise "Sorry, nothing found." unless @message_code == '200'
   
    @city = attributes['city']['name']    
    @message = response.message
    set_header_variables response.headers
    attributes['list'].each_with_index do |x, i| 
      if i == 0          
        @temperature_date = mmddyy_date(Date.parse(x['dt_txt']))
        @temperature = x['main']['temp']
      end
    end      
  end                    
  def set_header_variables headers
    @content_type = headers['content-type']
    @date = mmddyy_date(Date.parse(headers['date']))
    @server = headers['server']
    @transfer_encoding = headers['transfer-encoding']
    @connection = headers['connection']
  end
end