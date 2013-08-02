class Note < ActiveRecord::Base                                              
 include UserConcerns
  
 attr_accessible :content, :created_by, :updated_by, :notable_id, :notable_type, :type
 belongs_to :notable, :polymorphic => true


 def owner 
  notable
 end

 #alias_method :blurb, :content
end

# == Schema Information
#
# Table name: notes
#
#  id           :integer          not null, primary key
#  notable_type :string(255)      not null
#  notable_id   :integer          not null
#  type         :string(255)      not null
#  content      :string(255)      not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  created_by   :integer          not null
#  updated_by   :integer          not null
#

