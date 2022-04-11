class MyError < StandardError

  def initialize(msg)
    super
  end

end


class Simplification

  def initialize(exp)
    @exp = exp
  end

  def simplifier()

    #string to array conversion like 22+3/2 => ['22','+','3','/','2']
    arr = []
    s = 0
    for i in (0...@exp.length) do 
      if @exp[i] == '+' or @exp[i] == '-' or @exp[i] == '*' or @exp[i] == '/'
        arr.push(@exp[s...i])
        arr.push(@exp[i])
        s = i+1
      end
    end
    arr.push(@exp[s...@exp.length])

    #check expression
    for i in (0...arr.length) do
      begin
        raise MyError.new("Invalid Expression") if i%2 == 0 and "+-*/".include?(arr[i])
      rescue StandardError => e
        puts e.message
        exit 1
      end
    end

    #remove all '/' after executing and storing the result
    while arr.include?("/")
      indx = arr.index("/")
      first = arr[indx-1].to_i
      second = arr[indx+1].to_i
      begin
        raise MyError.new("No number can devided by zero") if second == 0
        arr.delete_at(indx+1)
        arr.delete_at(indx)
        arr.delete_at(indx-1)
        ans = first / second
        arr.insert(indx-1,ans)
      rescue StandardError => e
        puts e.message
        exit 1
      end
    end
    
    #remove all '*' after executing and storing the result
    while arr.include?("*")
      indx = arr.index("*")
      first = arr[indx-1].to_i
      second = arr[indx+1].to_i
      arr.delete_at(indx+1)
      arr.delete_at(indx)
      arr.delete_at(indx-1)
      ans = first * second
      arr.insert(indx-1,ans)
    end
    
    #remove all '+' after executing and storing the result
    while arr.include?("+")
      indx = arr.index("+")
      first = arr[indx-1].to_i
      second = arr[indx+1].to_i
      arr.delete_at(indx+1)
      arr.delete_at(indx)
      arr.delete_at(indx-1)
      ans = first + second
      arr.insert(indx-1,ans)
    end
    
    #remove all '-' after executing and storing the result
    while arr.include?("-")
      indx = arr.index("-")
      first = arr[indx-1].to_i
      second = arr[indx+1].to_i
      arr.delete_at(indx+1)
      arr.delete_at(indx)
      arr.delete_at(indx-1)
      ans = first - second
      arr.insert(indx-1,ans)
    end

    #after solve all the op only result should left
    if arr.length == 1
      puts arr[0]
    else 
      puts "Invalid Expression"
    end
  end
end


exp = gets.chomp
smp_obj = Simplification.new(exp)
smp_obj.simplifier