class Comment < ActiveRecord::Base
  
  belongs_to :journey

  # has_many :comments_as_sender, foreign_key: "sender_id", class_name: "Comment"
  # has_many :comments_as_receiver, foreign_key: "receiver_id", class_name: "Comment"
  

  before_validation :add_default_status

  def accept!
      self.status = "accepted"
      self.save
  end

  def reject!
      self.status = "rejected"
      self.save
  end

  def cancel!
      self.destroy
  end

  private
      def add_default_status
          self.status = "pending" if self.status.nil?
      end

end
