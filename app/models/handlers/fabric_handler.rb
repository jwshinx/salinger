class FabricHandler
  include Formatable   
  include Trackable
  attr_reader :fabric, :user, :amount, :date
                                      
  def initialize fabric, user, amount, date
    @fabric, @user = fabric, user          
    @amount = convert_dollars_to_cents amount
    @date = Date.strptime(date, '%m/%d/%Y')
  end                          
  
  def save
    return_value = nil
    ActiveRecord::Base.transaction do
      set_creator_and_updater @fabric, user
      @fabric.prices.each do |p| 
        set_creator_and_updater p, user    
        p.amount = @amount
        p.date = @date
      end
      return_value = @fabric.save
    end
    return_value
  end
end