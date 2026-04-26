import enemigos.*
import moradas.*
import artefactos.*


object rolando{
  var capacidadMaxima= 2
  const artefactos= #{} //es una constante porque no cambia la referencia
  const historialDeArtefactos= []
  var poderBase= 5
  const morada= castillo
  
  method encontrarArtefacto(_artefacto) {
    historialDeArtefactos.add(_artefacto)
    if(artefactos.size() < capacidadMaxima){
      artefactos.add(_artefacto)
    }
  }
  
  method capacidadMaxima(nuevaCapacidad) {
    capacidadMaxima= nuevaCapacidad
  }
    
  method capacidadMaxima(){
    return capacidadMaxima
  } 
  method artefactos() {
    return artefactos
  }
  
  method llegarA(hogar) {
    hogar.dejarArtefactos(artefactos)
    artefactos.clear()
  }

  method posesiones(hogar) {
    return self.artefactos().union(hogar.inventario())
  }

  method historialDeArtefactos(){
    return historialDeArtefactos
  } 

  method poderBase(nuevoPoder) {
    poderBase = nuevoPoder
  }

  method poderBase() {
    return poderBase
  } 

  method luchar() {
    poderBase = poderBase + 1
    artefactos.forEach({a=> a.usar()})
  }

  method poderDePelea() {
    return poderBase + artefactos.sum({a => a.poderQueAporta(self)})
  }

  method tieneArtefactosEnSuMorada() {
    return not morada.inventario().isEmpty() //isEmpty -> estaVacia
  }
 
  method artefactoMasPoderosoDeLaMorada() {
    return morada.artefactoMasPoderoso(self)
  }

 method enemigosVencibles(enemigos) {
    return enemigos.filter({ e => self.poderDePelea()> e.poderDePelea() })
  }

  method moradasConquistables(enemigos) {
    return self.enemigosVencibles(enemigos).map({ e => e.morada() }) // map transforma 
  }

  method esPoderoso(enemigos) {
    return enemigos.all({ e => self.poderDePelea()> e.poderDePelea()})
  }

  method tieneArtefactoFatalPara(enemigo) {
    return artefactos.any({ a => a.poderQueAporta(self) > enemigo.poderDePelea()})
  }

  method artefactoFatalPara(enemigo) {
    return artefactos.find({a => a.poderQueAporta(self) > enemigo.poderDePelea()})
  }
}
