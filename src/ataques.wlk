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
	const danio = null
	var property gastoEnergia = null
	
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
		arena.turnoActual(rival)
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
}

class AtaqueVertical inherits Ataque
{
	override method moverse(_)
	{
		position = position.down(1)
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
		personaje.energia((personaje.energia()+sumaEnergia).max(100))
		personaje.barraEnergia().actualizar(personaje.energia())
	}
}

// Ataque fuerte de fort
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
		if(personaje == menuPrincipal.personaje2())
		{
			inicioX = 19
			position = game.at(inicioX, posY)
		}
		game.sound(audio)
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
						position = position.down(1)
				})
				game.removeTickEvent("movimiento vertical arriba")
			}
			else
				position = position.up(1)
		})
	}
}