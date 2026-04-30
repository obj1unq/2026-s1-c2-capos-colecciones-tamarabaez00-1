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
  
  method llegarAMorada() {
    morada.dejarArtefactos(artefactos)
    artefactos.clear()
  }

  method posesiones() {
    return self.artefactos().union(morada.inventario())
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
    return poderBase + self.poderTotalDeArtefactos()
  }

  method poderTotalDeArtefactos() {
    return artefactos.sum({a => a.poderQueAporta(self)})
  }

  method poderArtefactoMasPoderosoDeLaMorada() {
    return if (morada.tieneArtefactos()){
      self.artefactoMasPoderosoDeLaMorada().poderQueAporta(self)
    }
    else{
      0
    }
  }
 
  method artefactoMasPoderosoDeLaMorada() { 
    return morada.artefactoMasPoderoso(self)
  }

 method enemigosVencibles(enemigos) {
    return (#{} + enemigos).filter({ e => self.poderDePelea()> e.poderDePelea() })
  }      //lo convierto en set y filtro todo junto

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
