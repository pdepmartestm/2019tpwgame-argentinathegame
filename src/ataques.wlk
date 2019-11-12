import wollok.game.*
import visuales.*
import menus.*
import personajes.*

class Ataque
{
	var property image
	var property audio
	var property inicioX = null
	var property finalX = null
	var property posY = null
	var property posYfinal = null
	var property position = null
	const danio = 0
	var property gastoEnergia = 0
	
	method usar(personaje, rival)
	{
		game.sound(self.audio())
		position = game.at(inicioX, posY)
		game.addVisual(self)
		game.onTick(100, "movimiento", {
			if(position == game.at(finalX, posYfinal))
			{
				game.removeVisual(self)
				game.removeTickEvent("movimiento")
				self.activarEfecto(personaje, rival)
				game.sound("audios/UnSoloGolpe.mp3")
			}
			else
				self.moverse(inicioX)
		})
	}
	method activarEfecto(personaje, rival)
	{
		self.cambiarEnergia(personaje)
		arena.cambiarTurno(rival)
		self.hacerDanio(personaje, rival)
	}
	method hacerDanio(personaje, rival)
	{
		if(rival.vida() > danio)
		{
			rival.vida(rival.vida()-danio)
			rival.barraVida().actualizar(rival.vida())
		}	
		else	
			personaje.ganar()
	}
	method cambiarEnergia(personaje)
	{
		personaje.energia(personaje.energia()-gastoEnergia)
		personaje.barraEnergia().actualizar(personaje.energia())
	}
	method moverse(inicio){}
	
	method setearPosicion(personaje){}
}

class AtaqueHorizontal inherits Ataque
{
	override method moverse(inicio)
	{
		if(inicio < 5)
			position = position.right(1)
		else
			position = position.left(1)
	}
	
	override method setearPosicion(personaje){
		
		posY = 6
		posYfinal = 6
		
		if(personaje == menuPrincipal.personaje1())
		{
			inicioX = 2
			finalX = 21
		}
		else
		{
			inicioX = 21
			finalX = 2
		}
	}
}

class AtaqueVertical inherits Ataque
{
	override method moverse(_)
	{
		position = position.down(1)
	}
	
	override method setearPosicion(personaje){
		
		posY = game.height()
		posYfinal = 5
		
		if(personaje == menuPrincipal.personaje1())
		{
			inicioX = 19
			finalX = 19
		}
		else
		{
			inicioX = 0
			finalX = 0
		}
	}
}

class AtaqueEnergia inherits Ataque
{
	const sumaEnergia = 50
	override method usar(personaje, rival)
	{
		game.sound(audio)
		position = game.at(0, 5)
		game.addVisual(self)
		var contador = 0
		game.onTick(1000, "tiempo de imagen", {
			if(contador == 3)
			{
				game.removeVisual(self)
				game.removeTickEvent("tiempo de imagen")
				self.activarEfecto(personaje,rival)
			}
			else contador += 1
		})
	}
	override method cambiarEnergia(personaje)
	{
		personaje.energia((personaje.energia()+sumaEnergia).min(100))
		personaje.barraEnergia().actualizar(personaje.energia())
	}
}

object fortFuerte inherits AtaqueEnergia(
	image = "ataques/fortFuerte.png",
	audio = "audios/Fort_cortaste_la_luz.mp3",
	danio = 40,
	gastoEnergia = 70
){
	override method cambiarEnergia(personaje)
	{
		personaje.energia(personaje.energia()-gastoEnergia)
		personaje.barraEnergia().actualizar(personaje.energia())
	}
}

object menemFuerte inherits AtaqueVertical(
		image = "ataques/menemFuerteArriba.png", 
		audio = "audios/NavesEspaciales.mp3", 
		posY = 5,
		danio = 40, 
		gastoEnergia = 70
	)
{
	override method usar(personaje, rival)
	{
		game.sound(audio)
		position = game.at(inicioX, posYfinal)
		game.addVisual(self)
		game.onTick(100, "movimiento vertical arriba", {
			if(position == game.at(inicioX, game.height()))
			{
				image = "ataques/menemFuerteAbajo.png"
				position = game.at(finalX, game.height())
				game.onTick(100, "movimiento vertical abajo", {
					if(position == game.at(finalX, 5))
					{
						game.removeVisual(self)
						position = game.at(inicioX, 5)
						game.removeTickEvent("movimiento vertical abajo")
						self.activarEfecto(personaje,rival)
						game.sound("audios/UnSoloGolpe.mp3")
						image = "ataques/menemFuerteArriba.png"
					}
					else
						self.moverse(inicioX)
				})
				game.removeTickEvent("movimiento vertical arriba")
			}
			else
				position = position.up(1)
		})
	}
	
	override method setearPosicion(personaje){
		
		posY = game.height()
		posYfinal = 5
		
		if(personaje == menuPrincipal.personaje1())
		{
			inicioX = 2
			finalX = 21
		}
		else
		{
			inicioX = 19
			finalX = 0
		}
	}
}

object macriFuerte inherits AtaqueHorizontal(
		image = "ataques/macriFuerte.png",
		audio = "audios/Macri_No_Se_Inunda_Mas.mp3",
		danio = 40,
		gastoEnergia = 60
	)
	{
	override method setearPosicion(personaje){
		
		posY = 5
		posYfinal = 5
		
		if(personaje == menuPrincipal.personaje1())
		{
			inicioX = 2
			finalX = 21
		}
		else
		{
			self.image("ataques/macriFuerteDer.png")
			inicioX = 18
			finalX = 0
		}
	}
}