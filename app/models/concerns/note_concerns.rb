module NoteConcerns
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def has_string_array_of_notes
      define_method "string_array_of_fyis" do
        return [] if fyis.empty?
        fyis.map{|f| f.content }  
      end
      define_method "string_array_of_todos" do
        return [] if todos.empty?
        todos.map{|t| t.content }  
      end
 
    end 
  end
end