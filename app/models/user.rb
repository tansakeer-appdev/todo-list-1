# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  lists_count     :integer
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many  :lists, :class_name => "List", :foreign_key => "user_id", :dependent => :destroy

  def list_stat_next_up
    list_stat=List.where({ :user_id => self.id}).where({:status => "next_up"}).all.order("created_at DESC")
  end

  def list_stat_in_progress
    list_stat=List.where({ :user_id => self.id}).where({:status => "in_progress"}).all.order("created_at DESC")
  end

  def list_stat_done
    list_stat=List.where({ :user_id => self.id}).where({:status => "done"}).all.order("created_at DESC")
  end

end
