defmodule Times do
	defmacro times_n(number) do
		quote do
			def unquote(:"times_#{number}")(x) do
				x * unquote(number)
			end 
		end
	end	
end

defmodule Test do
	require Times
	Times.times_n(3)
	Times.times_n(4)
end

