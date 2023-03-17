# == Schema Information
#
# Table name: deliveries
#
#  id              :integer          not null, primary key
#  arrival_date    :date
#  carrier         :string
#  description     :string
#  status          :string
#  tracking_number :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#
class Delivery < ApplicationRecord


  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id", :counter_cache => true })
  
end
