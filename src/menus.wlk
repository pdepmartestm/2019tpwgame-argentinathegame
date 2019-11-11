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
		//game.sound("audios/export (1).wav") NO SE PUEDE SUBIR EL AUDIO PORQUE PESA MAS DE 25MB
		game.addVisual(interfazArena)
		keyboard.num(1).onPressDo{self.menuSeleccionPersonajes() arenaSeleccionada = casaRosada}
		keyboard.num(2).onPressDo{self.menuSeleccionPersonajes() arenaSeleccionada = bombonera}
		keyboard.num(3).onPressDo{self.menuSeleccionPersonajes() arenaSeleccionada = showMatch}
	}
	method menuSeleccionPersonajes()
	{
		game.clear()
		game.addVisual(interfazSeleccion)
		game.addVisual(maiori)	
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
			game.say(maiori,"Elegiste a " + personaje.nombre())
			personaje.barraVida(vidaIzq)
			personaje.barraEnergia(energiaIzq)
			personaje.ataqueDebil().setearPosicion(personaje1)
			personaje.ataqueFuerte().setearPosicion(personaje1)
		}
		else if(personaje1 == personaje)
			game.say(maiori,"No podes elegir el mismo personaje")
		else
		{
			personaje2 = personaje 
			game.say(maiori,"Elegiste a " + personaje.nombre())
			personaje.barraVida(vidaDer)
			personaje.barraEnergia(energiaDer)
			personaje.ataqueDebil().setearPosicion(personaje2)
			personaje.ataqueFuerte().setearPosicion(personaje2)
			personaje.imagenBase(personaje.imagenBaseDer())
			personaje.imagenGolpe(personaje.imagenGolpeDer())
			personaje.image(personaje.imagenBaseDer())
			game.schedule(200, { => arena.iniciarLucha()})
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
		keyboard.q().onPressDo{self.ordenarAtaque(personaje1, personaje2, personaje1.ataqueDebil())}
		keyboard.w().onPressDo{self.ordenarAtaque(personaje1, personaje2, personaje1.ataqueFuerte())}
		keyboard.e().onPressDo{self.ordenarAtaque(personaje1, personaje2, personaje1.ataqueEnergia())}
		keyboard.i().onPressDo{self.ordenarAtaque(personaje2, personaje1, personaje2.ataqueDebil())}
		keyboard.o().onPressDo{self.ordenarAtaque(personaje2, personaje1, personaje2.ataqueFuerte())}
		keyboard.p().onPressDo{self.ordenarAtaque(personaje2, personaje1, personaje2.ataqueEnergia())}
	}
	
	method ordenarAtaque(personaje, rival, ataque)
	{
		if(turnoActual == personaje)
		{
			personaje.golpearCon(ataque,rival)
			indicadorTurno.position(rival.posicionTurno())
		}
		else game.say(personaje, "No es mi turno")
	}
	
	method cambiarTurno(aQuienLeToca){
		turnoActual = aQuienLeToca
		indicadorTurno.position(aQuienLeToca.posicionTurno())
	}	
}
