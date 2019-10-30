import wollok.game.*
import menus.*

class Visual
{
	var property image
	var property position = null
}

const interfazInicial = new Visual(
	image = "interfaces/interfazInicial.png",
	position = game.origin()
)
const interfazSeleccion = new Visual(
	image = "interfaces/interfazSeleccion.png",
	position = game.origin()
)

const interfazArena = new Visual(
	image = "interfaces/interfazArena.jpeg",
	position = game.origin()
)

const selectorAtaques = new Visual(
	image = "interfaces/selectorAtaques.png",
	position = game.origin()
)

const indicadorTurno = new Visual(
	image = "interfaces/indicadorDeTurno.png"
)

const qweCristina = new Visual(
	image = "interfaces/qweCristina.png",
	position = game.at(0,1)
)
const qweFort = new Visual(
	image = "interfaces/qweFort.png",
	position = game.at(0,1)
)
const qweMacri = new Visual(
	image = "interfaces/qweMacri.png",
	position = game.at(0,1)
)
const qweMaradona = new Visual(
	image = "interfaces/qweMaradona.png",
	position = game.at(0,1)
)
const qweMenem = new Visual(
	image = "interfaces/qweMenem.png",
	position = game.at(0,1)
)
const iopCristina = new Visual(
	image = "interfaces/iopCristina.png",
	position = game.at(14,1)
)
const iopFort = new Visual(
	image = "interfaces/iopFort.png",
	position = game.at(14,1)
)
const iopMacri = new Visual(
	image = "interfaces/iopMacri.png",
	position = game.at(12,1)
)
const iopMaradona = new Visual(
	image = "interfaces/iopMaradona.png",
	position = game.at(14,1)
)
const iopMenem = new Visual(
	image = "interfaces/iopMenem.png",
	position = game.at(14,1)
)
const casaRosada = new Visual(
	image = "arenas/casaRosada.jpg",
	position = game.at(0,5)
)
const showMatch = new Visual(
	image = "arenas/showMatch.jpg",
	position = game.at(0,5)
)
const bombonera = new Visual(
	image = "arenas/bombonera.jpg",
	position = game.at(0,5)
)

class Barra inherits Visual
{
	var property direccionImagen
	method actualizar(variable)
	{
		game.removeVisual(self)
		image = direccionImagen + variable + ".png"
		if(self == vidaDer)
			position = game.at(14+(100-variable)/10, 14)
		else if(self == energiaDer)
			position = game.at(14+(100-variable)/10, 13)
		game.addVisual(self)
	}
}

const vidaIzq = new Barra(
	image = "interfaces/vida100.png",
	position = game.at(1,14),
	direccionImagen = "interfaces/vida"
)

const energiaIzq = new Barra(
	image = "interfaces/energia100.png",
	position = game.at(1,13),
	direccionImagen = "interfaces/energia"
)

const vidaDer = new Barra(
	image = "interfaces/vida100.png",
	position = game.at(14,14),
	direccionImagen = "interfaces/vida"
)

const energiaDer = new Barra(
	image = "interfaces/energia100.png",
	position = game.at(14,13),
	direccionImagen = "interfaces/energia"
)