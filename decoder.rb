# primeros 2 bytes :
# 00 = login      , 
# 01 = posicion
# 02 = evento
#
########### caso login:
# respuesta : 100
# 
########### caso posicion:
# respuesta: si es valido=111, si es invalido=110
# dato | bytes
# id = 2-9
# timestamp = 10-19
# sur o norte = 20 (SUR vuelve negativo la coordenada)
# lat = 21-27
# oeste o este = 28 (OESTE vuelve negativo la coordenada)
# lon = 29-35
# validez = 36 (A=valido,V=invalido)
# velocidad = 37-38
# 
#
#
########### caso evento
#respuesta : 120
# dato | bytes
# output_code = 2-3
# output_value = 4-5
require "active_support/all"
class Decoder
	@id
	@datetime
	@speed
	@valid
	@lat
	@lon
	@response
	@pack
	@output_code
	@output_value

	attr_accessor :id, :datetime, :speed, :valid, :lat, :lon, :output_code, :output_value, :response

	def initialize()
	end

	def read(pack)
		@pack = pack
		self
	end

	def login()
		if @pack == "00"
			@response = "100"
			return true
		end 
		return false
	end

	def id
			if @pack.length <= 10
				return @id
			end
			@id = @pack[2..9]
			return @id
	end

	def datetime
		@datetime = Time.at(@pack[10..19].to_i).to_s
		return @datetime[0..18]
	end

	def speed
		return @pack[37..38]
	end

	def valid
		if  @pack[36] == "A"
			@valid = "A"
		elsif @pack[36] == "V"
			@valid = "V"
		else
			abort("Error Invalid value")
		end
		return @valid
	end

	def lat
		orientacionLat = ""
		if @pack[20] == "S"
			orientacionLat = "-"
		end	
		lat = orientacionLat << @pack[21..27]
		@lat = lat.to_f
		return @lat
	end

	def lon
		orientacionLon = ""
		if @pack[28] == "W"
			orientacionLon = "-"
		end	
		lon = orientacionLon << @pack[29..35]
		@lon = lon.to_f
		return @lon
	end

	def event
		return @pack[0..1]
	end

	def output_code
		@output_code = @pack[2..3]
		return @output_code
	end

	def output_value
		@output_code = @pack[4..5]
		return @output_code
	end

	def response(contador)
		case contador
		when 3,7
			@response = "111"
		when 5
			@response = "110"	
		end
		return @response
	end
end