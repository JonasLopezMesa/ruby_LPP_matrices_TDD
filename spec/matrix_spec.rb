#require File.join(File.dirname(__FILE__), "spec_helper")
require "spec_helper"
Module Math
	describe Matrix do
		before :each do
              @p = Matrix.new(3, 3)
            end
		#Debe existir el operador []
		context "1. Si se quiere indexar cualquier elemento de la matriz" do
            it "Debe hacerse mediante el operador []" do
            	expect(@p[2,1]).to be_a_kind_of(Fixnum)
            	expect(@p[2,1]).to eq(6)
            end
        end
        #Debe poder realizar las siguientes operaciones básicas:
		context "2. Deben poderse hacer las siguientes operaciones básicas:" do
			it "2.1 Multiplicación" do
				a = Matrix.new(3, 3)
				b = a * @p
				expect(b[1,1]).to be_a_kind_of(Fixnum)
            	expect(b[1,1]).to eq(81)
			end
			it "2.2 División" do
				a = Matrix.new(3, 3)
				a[1,2] = 15
				b = @p/a
            	expect(b[1,1]).to eq(52.5)
			end
			it "2.3 Suma" do
				a = Matrix.new(3, 3)
				b = []
				b = a + @p
            	expect(b[4]).to eq(10)
			end
			it "2.4 Resta" do
				a = Matrix.new(3, 3)
				b = []
				b = a - @p
            	expect(b[4]).to eq(0)
			end
		end 
	end
end