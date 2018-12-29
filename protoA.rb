$a_secuence=[
	"00",
	"<<",
	"01888888881541906963S11.4444W71.3333A40",
	"<<",
	"01888888881541906963S11.4444W71.3333V40",
	"<<",
	"01888888881541906963S11.4444W71.3333A40",
	"<<",
	"020100",
	"<<"
]

class ProtoA
	@order_secuence

	def initialize()
		@order_secuence = 0
	end

	def read
		r = $a_secuence[@order_secuence]
		@order_secuence += 1
		return r
	end

	def write(rsp)
		if @order_secuence == 1 and rsp == "100"
 			@order_secuence += 1
			return "OK"
		elsif @order_secuence == 3 and rsp == "111"
			@order_secuence += 1
			return "OK"
		elsif @order_secuence == 5 and rsp == "110"
			@order_secuence += 1
			return "OK"
		elsif @order_secuence == 7 and rsp == "111"
			@order_secuence += 1
			return "OK"
		else	
			puts "order secuence and response: "
			puts @order_secuence
			puts rsp
			abort("WRONG RESPONSE: ABORT")
		end
	end

	def order_secuence
		return @order_secuence
	end
end

def pass(value,expected)
	if value != expected
		puts "value: #{value}"
		puts "expected: #{expected}"
		abort("FAIL VALUE EXPECTED: ABORT")
	end
end