import wollok.game.*
import visuales.*
import ataques.*
import menus.*

class Personaje
{
	var property vida = 100
	var property energia = 100
	var property barraVida = null
	var property barraEnergia = null
	var property ataqueDebil
	var property ataqueFuerte
	var property ataqueEnergia
	var property ataquesIzq
	var property ataquesDer
	var property imagenBase
	var property imagenGolpe
	var property imagenBaseDer
	var property imagenGolpeDer
	var property imagenGanador
	var property posicionTurno = null
	var property image
	var property position = null

	
	method ganar()
	{
		game.clear()
		self.position(game.origin())
		self.image(imagenGanador)
		game.addVisual(self)
		keyboard.enter().onPressDo{game.stop()}
	}
}

const cristinaKirchner = new Personaje(
	ataqueDebil = cfkDebil,
	ataqueFuerte = cfkFuerte,
	ataqueEnergia = cfkEnergia,
	ataquesIzq = qweCristina,
	ataquesDer = iopCristina,
	imagenBase = "personajes/cfkBase.png", 
	imagenGolpe = "personajes/cfkGolpe.png",
	imagenBaseDer = "personajes/cfkBaseDer.png",
	imagenGolpeDer = "personajes/cfkGolpeDer.png",
	imagenGanador = "personajes/cfkGanadora.png",
	image = "personajes/cfkBase.png"
)
const mauricioMacri = new Personaje(
	ataqueDebil = macriDebil,
	ataqueFuerte = macriFuerte,
	ataqueEnergia = macriEnergia, 
	ataquesIzq = qweMacri,
	ataquesDer = iopMacri,
	imagenBase = "personajes/macriBase.png", 
	imagenGolpe = "personajes/macriGolpe.png",
	imagenBaseDer = "personajes/macriBaseDer.png",
	imagenGolpeDer = "personajes/macriGolpeDer.png",
	imagenGanador = "personajes/macriGanador.png",
	image = "personajes/macriBase.png"
)
const ricardoFort = new Personaje(
	ataqueDebil = fortDebil,
	ataqueFuerte = fortFuerte,
	ataqueEnergia = fortEnergia, 
	ataquesIzq = qweFort,
	ataquesDer = iopFort,
	imagenBase = "personajes/fortBase.png", 
	imagenGolpe = "personajes/fortGolpe.png",
	imagenBaseDer = "personajes/fortBaseDer.png",
	imagenGolpeDer = "personajes/fortGolpeDer.png",
	imagenGanador = "personajes/fortGanador.png",
	image = "personajes/fortBase.png"
)
const diegoMaradona = new Personaje(
	ataqueDebil = maradonaDebil,
	ataqueFuerte = maradonaFuerte,
	ataqueEnergia = maradonaEnergia, 
	ataquesIzq = qweMaradona,
	ataquesDer = iopMaradona,
	imagenBase = "personajes/maradonaBase.png", 
	imagenGolpe = "personajes/maradonaBase.png",
	imagenBaseDer = "personajes/maradonaBaseDer.png",
	imagenGolpeDer = "personajes/maradonaBaseDer.png",
	imagenGanador = "personajes/maradonaGanador.png",
	image = "personajes/maradonaBase.png"
)
const carlosMenem = new Personaje(
	ataqueDebil = menemDebil,
	ataqueFuerte = menemFuerte,
	ataqueEnergia = menemEnergia, 
	ataquesIzq = qweMenem,
	ataquesDer = iopMenem,
	imagenBase = "personajes/menemBase.png", 
	imagenGolpe = "personajes/menemGolpe.png",
	imagenBaseDer = "personajes/menemBaseDer.png",
	imagenGolpeDer = "personajes/menemGolpeDer.png",
	imagenGanador = "personajes/menemGanador.jpg",
	image = "personajes/menemBase.png"
)