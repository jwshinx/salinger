class Fyi < Note
 def get_content
  content
 end
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

