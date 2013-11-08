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
		
		def *(other)
			resultado = Matrix.new(@f, @c)
        	if @f*@c == other.c*other.f
            	for i in (0...@c) do
                	for j in (0...@f) do
                		s = 0
                		for k in (0...@c) do s = s + (@m[i+(k*@c)] * other.m[k+(j*other.c)]) end
                		resultado[i,j] = s
                	end
            	end
        	else
                puts "Las matriz A debe tener el mismo número de filas que las columnas de B"
        	end
        	resultado
		end

		def +(other)
			i = 0
			tmp = []
			while i < @f*@c
				tmp[i] = @m[i]+other.m[i]
				i=i+1
			end
			tmp
		end

		def -(other)
			i = 0
			tmp = []
			while i < @f*@c
				tmp[i] = @m[i]-other.m[i]
				i=i+1
			end
			tmp
		end

		def det(*other)
			resultado = 0
			if other.size == 0
				for i in (0...@c) do
						j = 0;
						adj = []
						z = 0
						for x in (0...@c) do
							for y in (0...@f) do
								if (x != i) && (y != j)
									adj[z] = @m[x+(y*@c)]
									z=z+1
								end
							end
						end
						if ((i+1)+(j+1))%2 == 0
							resultado = resultado + @m[i+(j*@c)]*det(adj)
						else
							resultado = resultado - @m[i+(j*@c)]*det(adj)
						end
				end
			else 
				if other[0].size == 1
					tmp = other[0]
					return tmp[0]
				else 
					if other[0].size >= 4
						for i in (0...Math.sqrt(other[0].size).to_i) do
								j=0
								adj = []
								z = 0
								for x in (0...Math.sqrt(other[0].size).to_i) do
									for y in (0...Math.sqrt(other[0].size).to_i) do
										if (x != i) && (y != j)
											adj[z] = other[0][x+(y*Math.sqrt(other[0].size).to_i)]
											z=z+1
										end
									end
								end
								if ((i+1)+(j+1))%2 == 0
									tmp = other[0]
									resultado = resultado + tmp[i+(j*Math.sqrt(other[0].size).to_i)]*det(adj)
								else
									tmp = other[0]
									resultado = resultado - tmp[i+(j*Math.sqrt(other[0].size).to_i)]*det(adj)
								end
						end
					end
				end
			end
			return resultado
		end

		def adj()
			resultado = Matrix.new(@c,@f)
			for i in (0...@c) do
				for j in (0...@f) do
					adj = []
					z = 0
					for x in (0...@c) do
						for y in (0...@f) do
							if (x != i) && (y != j)
								adj[z] = @m[x+(y*@c)]
								z=z+1
							end
						end
					end
					if ((i+1)+(j+1))%2 == 0
						resultado[i,j] = det(adj)
					else
						resultado[i,j] = -det(adj)
					end
				end
			end
			return resultado
		end

		def tras()
			resultado = Matrix.new(@c,@f)
			for i in (0...@c) do
				for j in (0...@f) do
					resultado[i,j] = @m[j+(i*@c)]
				end
			end
			return resultado
		end

		def inv
			determinante = self.det
			if determinante != 0
				resultado = Matrix.new(@c,@f)
				resultado = self.adj
				resultado = resultado.tras
				for i in (0...resultado.c) do
					for j in (0...resultado.f) do
						resultado[i,j] = (1/determinante.to_f)*resultado[i,j]
					end
				end
				return resultado
			end
		end

		def imprimir
			for i in (0...@c*@f) do
				print "#{@m[i].round(2)}\t"
				if i % @c == 2
					print "\n"
				end
			end
		end

		def /(other1)
			resultado = Matrix.new(@f, @c)
			other = other1.inv
        	if @f*@c == other.c*other.f
            	for i in (0...@c) do
                	for j in (0...@f) do
                		s = 0
                		for k in (0...@c) do s = s + (@m[i+(k*@c)] / other.m[k+(j*other.c)]) end
                		resultado[i,j] = s
                	end
            	end
        	else
                puts "Las matriz A debe tener el mismo número de filas que las columnas de B"
        	end
        	resultado
		end
	end
end
