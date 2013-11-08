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
	end
end