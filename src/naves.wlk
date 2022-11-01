class NaveEspacial {
	var property velocidad = 0
	var property direccion = 0
	var property combustible = 0
	
	method acelerar(cuanto) {
		velocidad = (velocidad + cuanto).min(100000)
	}
	method desacelerar(cuanto) {
		velocidad = (velocidad - cuanto).max(0) 
	 }
	
	method irHaciaElSol() { direccion = 10 }
	
	method escaparDelSol() { direccion = -10 }
	
	
	method ponerseParaleloAlSol() { direccion = 0 }
	
	
	method acercarseUnPocoAlSol() {
		direccion += 1
	}
	method alejarseUnPocoDelSol() {
		direccion -= 1
	}
	method cargarCombustible(cantidad) {
		combustible += cantidad
	}
	method descargarCombustible(cantidad) {
		combustible -= cantidad
	}
	method prepararViaje(){
		self.cargarCombustible(30000)
		self.acelerar(5000)		
	}
	method estaTranquila() {
		return combustible >= 4000 and velocidad < 12000
	}

}

class naveBaliza inherits NaveEspacial{
	var property colorBaliza = "Rojo"
	
	method cambiarColorDeBaliza(colorNuevo){
		colorBaliza = colorNuevo
	} 
	override method prepararViaje() {
		super()
		colorBaliza = "Verde"
		self. ponerseParaleloAlSol()
	}
	override method estaTranquila() {
		return super() and colorBaliza == "Rojo"
	}	
}

class NavesDePasajeros inherits NaveEspacial {
	const property cantidadDePasajeros = 0
	var property racionesDeComida = 0
	var property  cantidadDeBebidas = 0
	
	method cargarComida(cantidad){
		 racionesDeComida += cantidad
	}
	method descargarComida(cantidad){
		 racionesDeComida = (racionesDeComida - cantidad).max(0)
	}
	method cargarBebidas(cantidad){
		 cantidadDeBebidas += cantidad
	}
	method descargarBebidas(cantidad){
		 cantidadDeBebidas = (cantidadDeBebidas - cantidad).max(0)
	}
	override method prepararViaje() {
		super()
		self.cargarComida(cantidadDePasajeros *4)
		self.cargarBebidas(cantidadDePasajeros * 6) 
		self.acercarseUnPocoAlSol()
		
	}
	
}

class NavesDeCombate inherits NaveEspacial {
	const property mensajesEmitidos = []
	var property misilesDesplegados 
	
	method ponerseVisible() {
			return true
	}
	method ponerseInvisible() {
			 return false
	}
	method emitirMensaje(mensaje){
		mensajesEmitidos.add([mensaje])
	}
	method mensajesEmitidos() {
		return mensajesEmitidos.count()
	}
	method primerMensajeEmitido() {
		return mensajesEmitidos.first()
	}
	method ultimoMensajeEmitido() {
		return mensajesEmitidos.last()
	}
	method esEscueta() {
		
	}
	method emitioMensaje(){
		
	}

	override method prepararViaje() {
		super()
		self.ponerseVisible()
		self.acelerar(15000 )
		self.emitirMensaje("Saliendo en mision")
		
	}
	override method estaTranquila() {
		return super() and misilesDesplegados 
	}
}


class NaveHospital inherits NavesDePasajeros {
	var property quirofanoPreparado = true
	
	override method estaTranquila() {
		return super() and not self.quirofanoPreparado()
	}
}

class NaveDeCombateSigilosa inherits NavesDeCombate {
	override method estaTranquila() {
		return super() and not self.ponerseVisible() 
	}
} 