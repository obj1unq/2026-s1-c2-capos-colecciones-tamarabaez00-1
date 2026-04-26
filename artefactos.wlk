import capos.*
import moradas.*
import enemigos.*

object collarDivino {
  const poderBase= 3
  var cantUsada= 0

  method cantUsada(_cantUsada) {
    cantUsada= _cantUsada
  }

  method poderQueAporta(personaje){
    if(personaje.poderBase() > 6){
       return poderBase + (1 * cantUsada)
    }
    else{
      return poderBase + 0
    }
  }

  method usar() {
    cantUsada= cantUsada + 1
  }
  
}

object espadaDelDestino {
  var fueUsada= false

  method usar() { 
    fueUsada= true
  }

  method poderQueAporta(personaje) {
   if(fueUsada){
    return personaje.poderBase() /2
   }
   else {
    return personaje.poderBase()
   }
 }

}

object armaduraDeAcero {
  const poderBase = 6

  method poderQueAporta(_personaje) {
    return poderBase
  }

  method usar() {
    
  }
}

object libroDeHechizos {
  const hechizos = [] 

  method agregarHechizo(_hechizo) {
    hechizos.add(_hechizo)
  }

  method poderQueAporta(personaje) {
    if( hechizos.isEmpty()){
      return 0
    }
    else {
      return hechizos.first().poderQueAporta(personaje) // poder que aporta el PRIMERO 
    }
  }
  
  method usar(){
    if(not hechizos.isEmpty()){
      hechizos.remove(hechizos.first())   //saca el primero
    }
  }
}


object bendicion {
  const poderBase = 4

  method poderQueAporta(personaje) {
    return poderBase
  }
}

object invisibilidad {
  method poderQueAporta(personaje) {
    return personaje.poderBase()
  }
}

object invocacion {

  method poderQueAporta(personaje) {
    if (personaje.tieneArtefactosEnSuMorada()){
      return personaje.artefactoMasPoderosoDeLaMorada().poderQueAporta(personaje)
    }
    else{
      return 0
    }
  }

}