# == Schema Information
#
# Table name: lists
#
#  id               :integer          not null, primary key
#  status           :string
#  task_description :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#
class List < ApplicationRecord

  belongs_to :user, :required => true, :class_name => "User", :foreign_key => "user_id", :counter_cache => true

  validates :task_description, :presence => true



end
