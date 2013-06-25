class EvalSmetto
  
 def initialize(model)
  @model = model
 end
 def is_evalable?
  return false if @model.nil? || @model.gsub(/\s+/, "") == ''
  return true if @model == 'Customer' || @model == 'Product'
  false
 end
end
