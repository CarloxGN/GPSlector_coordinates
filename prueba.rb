class Lectura
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

	def initialize()
	end

	def cadena
		return $a_secuence
	end
end
leer = Lectura.new()

cadena_total = leer.cadena

puts cadena_total[0] # Si valor  es "00" respuesta 100

cadena_2 = cadena_total[2]

if cadena_2[0..1] == "01"
	puts "Posicion:" 
	puts posicion = cadena_2[0..1] # posicion = 01
	puts "Usuario:" 
	puts id = cadena_2[2..9] # Identificacion de usuario
	puts "Timestamp:" 
	tiempo = Time.at(cadena_2[10..19].to_i).to_s
	puts tiempo[0..18]
	puts "latitud:"
	orientacionLat = ""
	if cadena_2[20] == "S"
		orientacionLat = "-"
	end	
	puts latitud = orientacionLat << cadena_2[21..27]

	puts "longitud:"
	orientacionLon = ""
	if cadena_2[28] == "W"
		orientacionLon = "-"
	end	
	puts longitud = orientacionLon << cadena_2[29..35]

	puts "Validez:"
	if  cadena_2[36] == "A"
		puts "Valido"
	elsif cadena_2[36] == "V"
		puts "Invalido"
	else
		puts "Codigo no reconocido"
	end

	puts "Velocidad:"
	puts velocidad = cadena_2[37..38]
	
elsif cadena_2[0..1] == "02"	
	puts "Evento:"
	puts evento = cadena_2[0..1] # evento = 02
	puts "Codigo de salida:"
	puts cod_salida = cadena_2[2..3] # output_code = 2-3
	puts "Valor de salida:"
	puts val_salida = cadena_2[4..5] # output_value = 4-5
else
	puts "Entrada no valida"
end

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
#respusta : 120
# dato | bytes
# output_code = 2-3
# output_value = 4-5
gets()