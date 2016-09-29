require 'pry'

class Transfer


  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    # binding.pry
  end

  def valid?
    # if sender.status == "open" && receiver.status == "open"
    if sender.valid? && receiver.valid?
      return true
    else
      return false
      # binding.pry
    end
  end

  def execute_transaction
    if valid? == true && receiver.balance > @amount && @status == "pending"
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += @amount
      receiver.balance -= @amount
      @status = "reversed"
    end
  end
end # close class
