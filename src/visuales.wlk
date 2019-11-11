import wollok.game.*
import menus.*

class Visual
{
	var property image
	var property position = null
}

const maiori = new Visual(
	image = "interfaces/MaioriCara.png",
	position = game.at(20,8)
)

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

class BarraIzq inherits Visual
{
	var property direccionImagen
	method actualizar(variable)
	{
		game.removeVisual(self)
		image = direccionImagen + variable + ".png"
		game.addVisual(self)
	}
}

class BarraDer inherits BarraIzq
{
	const posY
	override method actualizar(variable)
	{
		super(variable)
		position = game.at(14+(100-variable)/10, posY)
	}
}

const vidaIzq = new BarraIzq(
	image = "interfaces/vida100.png",
	position = game.at(1,14),
	direccionImagen = "interfaces/vida"
)

const energiaIzq = new BarraIzq(
	image = "interfaces/energia100.png",
	position = game.at(1,13),
	direccionImagen = "interfaces/energia"
)

const vidaDer = new BarraDer(
	image = "interfaces/vida100.png",
	posY = 14,
	position = game.at(14,14),
	direccionImagen = "interfaces/vida"
)

const energiaDer = new BarraDer(
	image = "interfaces/energia100.png",
	posY = 13,
	position = game.at(14,13),
	direccionImagen = "interfaces/energia"
)