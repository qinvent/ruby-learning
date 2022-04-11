class MyError < StandardError

  def initialize(msg)
    super
  end

end


class Calculator

  def get_input
    print "Enter the first value:"
    @a = gets.chomp.to_i
    print "Enter the second value:"
    @b = gets.chomp.to_i
  end

  def add
    puts "Addition "
    get_input
    puts "#{@a} + #{@b} = #{@a+@b}"
  end

  def sub
    puts "Subtraction"
    get_input
    puts "#{@a} - #{@sb} = #{@a-@b}"
  end

  def mul
    puts "Multipication"
    get_input
    puts "#{@a} x #{@b} = #{@a*@b}"
  end

  def div
    puts "Division"
    get_input

    begin
      raise MyError.new("No number can devided by zero") if @b == 0
      puts "#{@a} / #{@b} = #{@a.to_f/@b}"
    rescue StandardError => e
      puts e.message
    end
  end

  def fac
    puts "Factorial"
    print "Enter the value:"
    n = gets.chomp.to_i

    begin
      raise MyError.new("Invalid Input[negative number]") if n < 0
      f = 1
      for i in 1..n do 
        f *= i 
      end
      puts "#{n}! = #{f}"
    rescue StandardError => e
      puts e.message
    end
  end
end


puts "  ----------"
puts "| CALCULATOR |"
puts "  ----------"
puts "1.Addition"
puts "2.Subtraction"
puts "3.Multipication"
puts "4.Division"
puts "5.Factorial"
puts "6.Exit"

cal_obj = Calculator.new
while true
  print "Enter your choice:"
  op = gets.chomp.to_i
  case op
    when 1
      cal_obj.add
    when 2
      cal_obj.sub
    when 3
      cal_obj.mul
    when 4
      cal_obj.div
    when 5
      cal_obj.fac
    when 6
      puts "Exit"
      break
    else 
      puts "Invalid Input"
  end
end
