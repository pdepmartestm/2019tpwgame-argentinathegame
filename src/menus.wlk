import wollok.game.*
import visuales.*
import ataques.*
import personajes.*

object menuPrincipal
{
	var property arenaSeleccionada = null
	var property personaje1 = null
	var property personaje2 = null
	method menuInicial()
	{
		game.title("Argentina - The Game")
		game.width(25)
		game.height(15)
		game.addVisual(interfazInicial)
		keyboard.enter().onPressDo{self.menuSeleccionArena()}
		keyboard.num(9).onPressDo{game.stop()}
	}
	method menuSeleccionArena()
	{
		game.clear()
		game.sound("audios/export (1).wav")
		game.addVisual(interfazArena)
		keyboard.num(1).onPressDo{self.menuSeleccionPersonajes() arenaSeleccionada = casaRosada}
		keyboard.num(2).onPressDo{self.menuSeleccionPersonajes() arenaSeleccionada = bombonera}
		keyboard.num(3).onPressDo{self.menuSeleccionPersonajes() arenaSeleccionada = showMatch}
	}
	method menuSeleccionPersonajes()
	{
		game.clear()
		game.addVisual(interfazSeleccion)
		keyboard.num(1).onPressDo{self.seleccionar(mauricioMacri)}
		keyboard.num(2).onPressDo{self.seleccionar(carlosMenem)}
		keyboard.num(3).onPressDo{self.seleccionar(cristinaKirchner)}
		keyboard.num(4).onPressDo{self.seleccionar(diegoMaradona)}
		keyboard.num(5).onPressDo{self.seleccionar(ricardoFort)}
		keyboard.num(9).onPressDo{game.stop()}
	}
	method seleccionar(personaje)
	{
		if(personaje1 == null) 
		{
			personaje1 = personaje
			personaje.barraVida(vidaIzq)
			personaje.barraEnergia(energiaIzq)
			personaje.ataqueDebil().inicioX(2)
			personaje.ataqueDebil().finalX(21)
			personaje.ataqueFuerte().inicioX(2)
			personaje.ataqueFuerte().finalX(21)
			personaje.ataqueDebil().position(game.at(2,6))
			personaje.ataqueFuerte().position(game.at(2,personaje.ataqueFuerte().posY()))
		}
		else if(personaje1 == personaje)
			throw new Exception(message = "No podes elegir el mismo personaje")
		else
		{
			personaje2 = personaje 
			personaje.barraVida(vidaDer)
			personaje.barraEnergia(energiaDer)
			personaje.ataqueDebil().inicioX(21)
			personaje.ataqueDebil().finalX(2)
			personaje.ataqueFuerte().inicioX(8)
			personaje.ataqueFuerte().finalX(0)
			personaje.ataqueDebil().position(game.at(21,6))
			personaje.ataqueFuerte().position(game.at(8,personaje.ataqueFuerte().posY()))
			personaje.imagenBase(personaje.imagenBaseDer())
			personaje.imagenGolpe(personaje.imagenGolpeDer())
			personaje.image(personaje.imagenBaseDer())
			if(personaje == mauricioMacri)
				personaje.ataqueFuerte().image("ataques/macriFuerteDer.png")
			arena.iniciarLucha()
		}
	}
}

object arena
{
	var property turnoActual = null
	var personaje1 = menuPrincipal.personaje1()
	var personaje2 = menuPrincipal.personaje2()
	method iniciarLucha()
	{
		game.clear()
		game.addVisual(menuPrincipal.arenaSeleccionada())
		game.addVisual(selectorAtaques)
		// Personaje 1
		game.addVisual(vidaIzq)
		game.addVisual(energiaIzq)
		game.addVisual(personaje1.ataquesIzq())
		personaje1.position(game.at(1,5))
		personaje1.posicionTurno(game.at(0,13))
		game.addVisual(personaje1)
		// Personaje 2
		game.addVisual(vidaDer)
		game.addVisual(energiaDer)
		game.addVisual(personaje2.ataquesDer())
		personaje2.position(game.at(22,5))
		personaje2.posicionTurno(game.at(24,13))
		game.addVisual(personaje2)
		
		self.turnoActual([personaje2, personaje1].anyOne())
		indicadorTurno.position(turnoActual.posicionTurno())
		game.addVisual(indicadorTurno)
		keyboard.q().onPressDo{self.golpear(personaje1, personaje2, personaje1.ataqueDebil())}
		keyboard.w().onPressDo{self.golpear(personaje1, personaje2, personaje1.ataqueFuerte())}
		keyboard.e().onPressDo{self.golpear(personaje1, personaje2, personaje1.ataqueEnergia())}
		keyboard.i().onPressDo{self.golpear(personaje2, personaje1, personaje2.ataqueDebil())}
		keyboard.o().onPressDo{self.golpear(personaje2, personaje1, personaje2.ataqueFuerte())}
		keyboard.p().onPressDo{self.golpear(personaje2, personaje1, personaje2.ataqueEnergia())}
	}
	
	method golpear(personaje, rival, ataque)
	{
		if(turnoActual == personaje)
		{
			personaje.image(personaje.imagenGolpe())
			var contador = 0
			game.onTick(600, "tiempo imagen golpe", {
				if(contador != 1)
					contador += 1
				else
				{
					personaje.image(personaje.imagenBase())
					game.removeTickEvent("tiempo imagen golpe")
				}
			})
			if(ataque == personaje.ataqueEnergia() || self.chequearEnergia(personaje, ataque))
			{
				ataque.usar(personaje, rival)
				indicadorTurno.position(rival.posicionTurno())
			}
			else
				game.say(personaje, "No tengo energia")
		}
		else game.say(personaje, "No es mi turno")
	}
	
	method chequearEnergia(personaje, ataque) = personaje.energia() >= ataque.gastoEnergia()
}