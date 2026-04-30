import capos.*
import artefactos.*
import enemigos.*

object castillo {
  const inventario = #{}

  method dejarArtefactos(artefactos) {
    inventario.addAll(artefactos)
  }

  method tieneArtefactos() {
    return not inventario.isEmpty()
  }

  method inventario() {
    return inventario
  }

  method artefactoMasPoderoso(personaje) {
    return inventario.max({artefacto => artefacto.poderQueAporta(personaje)})
  }

}

object fortalezaDeAcero {
  
}

object palacioDeMarmol {
  
}

object torreDeMarfil {
  
}