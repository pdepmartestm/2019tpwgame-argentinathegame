import wollok.game.*
import visuales.*
import menus.*
import personajes.*

class AtaqueHorizontal
{
	var property image
	var property audio
	var property inicioX = null
	var property finalX = null
	var property posY = null
	var property position = null
	const danio = null
	var property gastoEnergia = null
	
	method usar(personaje, rival)
	{
		game.sound(self.audio())
		game.addVisual(self)
		game.onTick(100, "movimiento horizontal derecha", {
			if(position == game.at(finalX, posY))
			{
				position = game.at(inicioX, posY)
				game.removeVisual(self)
				game.removeTickEvent("movimiento horizontal derecha")
				self.activarEfecto(personaje, rival)
				game.sound("audios/UnSoloGolpe.mp3")
			}
			else
			{
				if(inicioX < 5)
					position = position.right(1)
				else
					position = position.left(1)
			}
		})
	}
	
	method activarEfecto(personaje, rival){
		if(rival.vida() > danio){
			rival.vida(rival.vida()-danio)
				personaje.energia(personaje.energia()-gastoEnergia)
				personaje.barraEnergia().actualizar(personaje.energia())
				rival.barraVida().actualizar(rival.vida())
				arena.turnoActual(rival)
		}	
		else	
			personaje.ganar()
	}
	
}

class AtaqueVertical inherits AtaqueHorizontal
{	
	override method usar(personaje, rival)
	{
		game.sound(audio)
		game.addVisual(self)
		position = game.at(finalX, posY)
		game.onTick(100, "movimiento vertical abajo", {
				if(position == game.at(finalX, 5))
				{
					game.removeVisual(self)
					position = game.at(finalX, posY)
					game.removeTickEvent("movimiento vertical abajo")
					self.activarEfecto(personaje,rival)
					game.sound("audios/UnSoloGolpe.mp3")
				}
				else
					position = position.down(1)
		})
	}
}

class AtaqueEnergia
{
	var property image
	var property audio
	var property position = game.at(0,5)
	
	const sumaEnergia = 50
	
	method usar(personaje, rival)
	{
		game.sound(audio)
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
	
	method activarEfecto(personaje,rival){
		if((personaje.energia() + sumaEnergia) >= 100)
		{
			personaje.energia(100)
			personaje.barraEnergia().actualizar(100)
		}
		else
		{
			personaje.energia(personaje.energia()+sumaEnergia)
			personaje.barraEnergia().actualizar(personaje.energia())
		}
		arena.turnoActual(rival)

	}
}

// Ataques cristina
const cfkEnergia = new AtaqueEnergia(
	image = "ataques/cfkEnergia.png",
	audio = "audios/Energia.mp3"
)

const cfkDebil = new AtaqueHorizontal(
	image = "ataques/cfkDebil.png",
	audio = "audios/Cristina_Choripan_De_Oro.mp3",
	posY = 6,
	danio = 10,
	gastoEnergia = 10
)

const cfkFuerte = new AtaqueVertical(
	image = "ataques/cfkFuerte.png",
	audio = "audios/AudioVacio.m4a",
	posY = game.height(),
	danio = 30,
	gastoEnergia = 40
)
// Ataques fort

const fortDebil = new AtaqueHorizontal(
	image = "ataques/fortDebil.png",
	audio = "audios/Fort_basta_chicos.mp3",
	posY = 6,
	danio = 20,
	gastoEnergia = 30
)

object fortFuerte inherits AtaqueHorizontal(	
	image = "ataques/fortFuerte.png",
	audio = "audios/Fort_cortaste_la_luz.mp3",
	posY = 6,
	danio = 40,
	gastoEnergia = 70 ){

	
	override method usar(personaje,rival){
		arena.turnoActual(rival)
		position = game.at(0,5)
		game.sound(audio)
		game.sound("audios/MuchosGOlpes.mp3")
		game.addVisual(self)
		var contador = 0
		game.onTick(1000, "tiempo de imagen", {
			if(contador == 4)
			{
				game.removeVisual(self)
				self.activarEfecto(personaje,rival)
				game.removeTickEvent("tiempo de imagen")
			}
			else contador += 1
		})
	}
}

const fortEnergia = new AtaqueEnergia(
	image = "ataques/fortEnergia.jpeg",
	audio = "audios/Fort_Maiameee.mp3"
)

// Ataques macri

const macriDebil = new AtaqueHorizontal(
	image = "ataques/macriDebil.png",
	audio = "audios/Macri_Ritmica_Spot_Revolucion_De_La_Alegria.mp3",
	posY = 6,
	danio = 20,
	gastoEnergia = 30
)

const macriFuerte = new AtaqueHorizontal(
	image = "ataques/macriFuerte.png",
	audio = "audios/Macri_No_Se_Inunda_Mas.mp3",
	posY = 5,
	danio = 40,
	gastoEnergia = 60
)

const macriEnergia = new AtaqueEnergia(
	image = "ataques/macriEnergia.png",
	audio = "audios/Energia.mp3"
)

// Ataques maradona

const maradonaDebil = new AtaqueHorizontal(
	image = "ataques/maradonaDebil.png",
	audio = "audios/Maradona_eeeeh.mp3",
	posY = 6,
	danio = 20,
	gastoEnergia = 10
)

const maradonaFuerte = new AtaqueVertical(
	image = "ataques/maradonaFuerte.png",
	audio = "audios/maradona-la-mano-de-dios-rodrigo-[AudioTrimmer.com].mp3",
	posY = game.height(),
	danio = 30,
	gastoEnergia = 50
)

const maradonaEnergia = new AtaqueEnergia(
	image = "ataques/maradonaEnergia.jpeg",
	audio = "audios/Energia.mp3"
)

// Ataques menem

const menemDebil = new AtaqueHorizontal(
	image = "ataques/menemDebil.png",
	audio = "audios/Menem_Un_Peso_Fuerte.mp3",
	posY = 6,
	danio = 10,
	gastoEnergia = 10
	
)
	
const menemEnergia = new AtaqueEnergia(
	image = "ataques/menemEnergia.png",
	audio = "audios/Menem_siganme.mp3"
)

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