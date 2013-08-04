require 'spec_helper'
require 'cancan/matchers'

describe OpenWeatherMapService do
  include Formatable   
    
  describe "for Sonoma URL" do
    before do
      @ws = OpenWeatherMapService.new('http://api.openweathermap.org/data/2.5/forecast?id=5397095&units=imperial')
    end
    subject { @ws }                        
    its(:city) { should == 'Sonoma' }
    its(:temperature_date) { should == mmddyy_date(Date.today) }
    its(:date) { should == mmddyy_date(Date.today) }
    its(:message_code) { should == '200' }
    its(:response_code) { should == '200'  }
    #its(:content_type) { should == 'application/json; charset=utf-8' }
    #its(:server) { should == 'nginx' }
    #its(:connection) { should == 'Close' }   
  end 
  describe "for unsuccessful request" do
    it "returns 'Sorry, something unexpected happened' exception" do                                                                                      
      expect {
       @ws = OpenWeatherMapService.new('http://api.openweathermap.org/data/2.5/xxxx')       
      }.to raise_error('Sorry, something unexpected happened.')
    end
  end

  describe "for Unknown URL" do
    it "returns 'Sorry, nothing found' exception" do
     expect {
      @ws = OpenWeatherMapService.new('http://api.openweathermap.org/data/2.5/forecast?id=539709538383838')       
     }.to raise_error('Sorry, nothing found.')
    end              
  end

end