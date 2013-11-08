Module Math
	class Matrix
		attr_accessor :m
		attr_accessor :f
		attr_accessor :c

		def initialize(filas, columnas)
			@f = filas
			@c = columnas
			@m = []
			i = 0
			while i < @f*@c
				@m[i] = i+1
				i=i+1
			end
		end

		def [](a,b)
			@m[a+(b*@c)]
		end

		def []=(a,b,r)
			@m[a+(b*@c)] = r
		end
	end
end
