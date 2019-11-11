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
	ataqueDebil = new AtaqueHorizontal(
		image = "ataques/cfkDebil.png",
		audio = "audios/Cristina_Choripan_De_Oro.mp3",
		posY = 6,
		posYfinal = 6,
		danio = 10,
		gastoEnergia = 10
	),
	ataqueFuerte = new AtaqueVertical(
		image = "ataques/cfkFuerte.png",
		audio = "audios/AudioVacio.m4a",
		posY = game.height(),
		posYfinal = 5,
		danio = 30,
		gastoEnergia = 40
	),
	ataqueEnergia = new AtaqueEnergia(
		image = "ataques/cfkEnergia.png",
		audio = "audios/Energia.mp3"
	),
	ataquesIzq = new Visual(
		image = "interfaces/qweCristina.png",
		position = game.at(0,1)
	),
	ataquesDer = new Visual(
		image = "interfaces/iopCristina.png",
		position = game.at(14,1)
	),
	imagenBase = "personajes/cfkBase.png", 
	imagenGolpe = "personajes/cfkGolpe.png",
	imagenBaseDer = "personajes/cfkBaseDer.png",
	imagenGolpeDer = "personajes/cfkGolpeDer.png",
	imagenGanador = "personajes/cfkGanadora.png",
	image = "personajes/cfkBase.png"
)
const mauricioMacri = new Personaje(
	ataqueDebil = new AtaqueHorizontal(
		image = "ataques/macriDebil.png",
		audio = "audios/Macri_Ritmica_Spot_Revolucion_De_La_Alegria.mp3",
		posY = 6,
		posYfinal = 6,
		danio = 20,
		gastoEnergia = 30
	),
	ataqueFuerte = new AtaqueHorizontal(
		image = "ataques/macriFuerte.png",
		audio = "audios/Macri_No_Se_Inunda_Mas.mp3",
		posY = 5,
		posYfinal = 5,
		danio = 40,
		gastoEnergia = 60
	),
	ataqueEnergia = new AtaqueEnergia(
		image = "ataques/macriEnergia.png",
		audio = "audios/Energia.mp3"
	), 
	ataquesIzq = new Visual(
		image = "interfaces/qweMacri.png",
		position = game.at(0,1)
	),
	ataquesDer = new Visual(
		image = "interfaces/iopMacri.png",
		position = game.at(12,1)
	),
	imagenBase = "personajes/macriBase.png", 
	imagenGolpe = "personajes/macriGolpe.png",
	imagenBaseDer = "personajes/macriBaseDer.png",
	imagenGolpeDer = "personajes/macriGolpeDer.png",
	imagenGanador = "personajes/macriGanador.png",
	image = "personajes/macriBase.png"
)
const ricardoFort = new Personaje(
	ataqueDebil = new AtaqueHorizontal(
		image = "ataques/fortDebil.png",
		audio = "audios/Fort_basta_chicos.mp3",
		posY = 6,
		posYfinal = 6,
		danio = 20,
		gastoEnergia = 30
	),
	ataqueFuerte = fortFuerte,
	ataqueEnergia = new AtaqueEnergia(
		image = "ataques/fortEnergia.jpeg",
		audio = "audios/Fort_Maiameee.mp3"
	), 
	ataquesIzq = new Visual(
		image = "interfaces/qweFort.png",
		position = game.at(0,1)
	),
	ataquesDer = new Visual(
		image = "interfaces/iopFort.png",
		position = game.at(14,1)
	),
	imagenBase = "personajes/fortBase.png", 
	imagenGolpe = "personajes/fortGolpe.png",
	imagenBaseDer = "personajes/fortBaseDer.png",
	imagenGolpeDer = "personajes/fortGolpeDer.png",
	imagenGanador = "personajes/fortGanador.png",
	image = "personajes/fortBase.png"
)
const diegoMaradona = new Personaje(
	ataqueDebil = new AtaqueHorizontal(
		image = "ataques/maradonaDebil.png",
		audio = "audios/Maradona_eeeeh.mp3",
		posY = 6,
		posYfinal = 6,
		danio = 20,
		gastoEnergia = 10
	),
	ataqueFuerte = new AtaqueVertical(
		image = "ataques/maradonaFuerte.png",
		audio = "audios/maradona-la-mano-de-dios-rodrigo-[AudioTrimmer.com].mp3",
		posY = game.height(),
		posYfinal = 5,
		danio = 30,
		gastoEnergia = 50
	),
	ataqueEnergia = new AtaqueEnergia(
		image = "ataques/maradonaEnergia.jpeg",
		audio = "audios/Energia.mp3"
	), 
	ataquesIzq = new Visual(
		image = "interfaces/qweMaradona.png",
		position = game.at(0,1)
	),
	ataquesDer = new Visual(
		image = "interfaces/iopMaradona.png",
		position = game.at(14,1)
	),
	imagenBase = "personajes/maradonaBase.png", 
	imagenGolpe = "personajes/maradonaBase.png",
	imagenBaseDer = "personajes/maradonaBaseDer.png",
	imagenGolpeDer = "personajes/maradonaBaseDer.png",
	imagenGanador = "personajes/maradonaGanador.png",
	image = "personajes/maradonaBase.png"
)
const carlosMenem = new Personaje(
	ataqueDebil = new AtaqueHorizontal(
		image = "ataques/menemDebil.png",
		audio = "audios/Menem_Un_Peso_Fuerte.mp3",
		posY = 6,
		posYfinal = 6,
		danio = 10,
		gastoEnergia = 10
	),
	ataqueFuerte = menemFuerte,
	ataqueEnergia = new AtaqueEnergia(
		image = "ataques/menemEnergia.png",
		audio = "audios/Menem_siganme.mp3"
	), 
	ataquesIzq = new Visual(
		image = "interfaces/qweMenem.png",
		position = game.at(0,1)
	),
	ataquesDer = new Visual(
		image = "interfaces/iopMenem.png",
		position = game.at(14,1)
	),
	imagenBase = "personajes/menemBase.png", 
	imagenGolpe = "personajes/menemGolpe.png",
	imagenBaseDer = "personajes/menemBaseDer.png",
	imagenGolpeDer = "personajes/menemGolpeDer.png",
	imagenGanador = "personajes/menemGanador.jpg",
	image = "personajes/menemBase.png"
)