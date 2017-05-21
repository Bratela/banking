
class Account
  attr_accessor :name, :balance
  def initialize(name, balance=0)
    @name = name
    @balance = balance
  end

  class << self
    def create (name)
        @accounts ||= []
        @accounts << Account.new(name)
    end

    def find name
          @accounts.find { |account| account.name == name }
    end
    def list
      ObjectSpace.each_object(Account).to_a
    end
  end


  ######
  private
  def pin
    pin = 1234
  end

  def pin_error
    return "Access denied: incorrect PIN!"
  end
  ########
  public
  def display_balance(pin_number)
    if pin_number == pin
    puts "Account name: #{@name}"
    puts "Balance: $#{@balance}."
    else
    puts pin_error
    end
  end

  def add(pin_number, ammount)
    if pin_number == pin
      @balance = @balance + ammount
      puts "Add to #{@name} - $#{ammount}. New balance: $#{@balance}."
    else
      puts pin_error
    end
  end

  def withdraw(pin_number, ammount)
    if pin_number == pin
      @balance = @balance - ammount
      puts "Withdrew $#{ammount}. New balance: $#{@balance}."
    else
      puts pin_error
  end

end

end
