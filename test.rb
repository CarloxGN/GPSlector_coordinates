load "protoA.rb"
load "decoder.rb"
puts "======================"
puts "testing ProtoA"
puts "======================"
puts "start: \n\n\n"
gps = ProtoA.new()
decoder = Decoder.new()
# codigo de ejemplo, revisar decoder.rb
streamcoder = decoder.read(gps.read())

if streamcoder.login
	puts "Login: #{gps.write(decoder.response(gps.order_secuence
))}"
end

# resolver desde aca
########################################################
streamcoder = decoder.read(gps.read()) 
#

pass(streamcoder.id,"88888888")
pass(streamcoder.datetime,"2018-11-10 22:29:23")
pass(streamcoder.lat,-11.4444)
pass(streamcoder.lon,-71.3333)

#
puts gps.write(decoder.response(gps.order_secuence))

########################################################
streamcoder = decoder.read(gps.read())
#
pass(streamcoder.valid,"V") 
#
puts gps.write(decoder.response(gps.order_secuence))
########################################################
streamcoder = decoder.read(gps.read())
#
pass(streamcoder.id,"88888888")
pass(streamcoder.datetime,"2018-11-10 22:29:23")
pass(streamcoder.lat,-11.4444)
pass(streamcoder.lon,-71.3333) 
pass(streamcoder.valid,"A")
pass(streamcoder.speed,"40") 
#
puts gps.write(decoder.response(gps.order_secuence))
########################################################
streamcoder = decoder.read(gps.read())
#
pass(streamcoder.output_code, "01")
pass(streamcoder.output_value, "00")
pass(streamcoder.id, "88888888")

puts "PASSED: OK"