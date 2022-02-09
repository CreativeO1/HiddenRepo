class String # is_integer Method for making sure string can convert to an integer
  def is_integer
    self.to_i.to_s == self
  end
end

def exponent(x, y)
  answer = 1

  if y.is_integer then
    x = x.to_f
    y = y.to_i

    if y >= 0 then
      for a in 1..y do
        answer = answer * x
      end
    elsif y < 0 then
      for a in 1..y.abs() do
        answer = answer / x
      end
    end
  else
    answer = "Exponent must be an integer!"
  end

  return answer
end

def factorial(x)
  if x.is_integer then
    answer = 1
    x = x.to_i

    if x >= 0
      for a in 1..x do
        answer = answer * a
      end

      return answer
    else
      return "X must be a natural number for this operation!"
    end
  else
    return "X must be an integer for this operation!"
  end
end

puts "Operations:\n  Add (X + Y)\n  Subtract (X - Y)\n  Multiply (X * Y)\n  Divide (X / Y)\n  Factorial (X !)\n  Exponent (X ^ Y)"

while true do
  puts "Awaiting input..."
  response = gets.chomp
  arr = response.split(/ /)
  number1 = arr.fetch(0, false)
  operator = arr.fetch(1, false)
  number2 = arr.fetch(2, false)

  if number1 then
    if ["+", "-", "*", "/", "^"].include?(operator) then
      if number2 then
        if operator == "+" then
          puts [number1, number2].map(&:to_f).inject(:+)
        elsif operator == "-" then
          puts [number1, number2].map(&:to_f).inject(:-)
        elsif operator == "*" then
          puts [number1, number2].map(&:to_f).inject(:*)
        elsif operator == "/" then
          puts [number1, number2].map(&:to_f).inject(:/)
        elsif operator == "^" then
          puts exponent(number1, number2)
        else
          puts "Invalid operator."
        end
      else
        puts "Invalid second number."
      end
    elsif operator == "!" then
      puts factorial(number1)
    end
  else
    puts "Invalid first number."
  end
end
