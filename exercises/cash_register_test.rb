require 'pry'

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @transaction = Transaction.new(10)
    @register = CashRegister.new(0)
  end

  def test_accept_money
    @transaction.amount_paid = 10

    previous_amount = @register.total_money
    @register.accept_money(@transaction)
    current_amount = @register.total_money

    assert_equal(previous_amount + 10, current_amount)
  end

  def test_change
    @transaction.amount_paid = 12.50

    change = @register.change(@transaction)
    assert_equal(2.5, @register.change(@transaction))
  end

  def test_give_receipt
    receipt_content = "You've paid $10.\n"
    assert_output(receipt_content) do
      @register.give_receipt(@transaction)
    end
  end
end