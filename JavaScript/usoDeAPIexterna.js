const API_URL = "https://swapi.dev/api/"; 
const PEOPLE = "people/:id/"; 

//Para hacer un request con JQuery (Que ya lo tengo instalado en este proyecto) tenemos que llamar al metodo $.get()

//El $.get requiere como parametros: 

// 1) La url en la que va a hacer el request

// 2) opciones (hay muchas). en este caso es un objeto llamado options que con {crossDomain: true} indica que el request
//    es en una pagina externa. (entre llaves porque es un objeto)

// 3) Una funcion que realizara lo que pidamos (La podemos crear ahi mismo o crearla afuera y pasarla por parametro)


// Luego de $.get() puedo usar el .fail() que requiere una funcion, la cual ejecutara en caso de un error al hacer la consulta


const options = {crossDomain: true}

function obtenerPersonaje(id){


	return new Promise((resolve, rejected) => {

		const url = `${API_URL}${PEOPLE.replace(":id", id)}`

		$
		.get(url , options , function(data){ 		
			resolve(data)		
		})
		.fail(() => rejected(id) )		
		
	})
}

function onError(id){

	console.log(`No se pudo encontrar al personaje ${id}, paquete`)
}


async function ObtenerPersonajes(){

	var ids = [1,2,3,4,5,6,7]
	var promesas = ids.map(id => {return obtenerPersonaje(id) })

	try{
		var personajes = await Promise.all(promesas)
		console.log(personajes)
	}catch(id){
		onError(id)
	}
}

ObtenerPersonajes()

//Todavia no me quedo taaan claro todo esto de las promesas, tarea: reveerlo de otro lado 