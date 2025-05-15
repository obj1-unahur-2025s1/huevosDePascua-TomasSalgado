object huevoRepostero {

    method calorias(){
        return 750
    }

    method tieneChocolateBlanco() = true
}

object huevoMixto {
  
  method calorias(){
    return 900
  }

  method tieneChocolateBlanco() = true
}

object conejo {

    var property peso = 0

    method calorias(){
        return (peso * 10)
    }
    
    method tieneChocolateAmargo() = true
}

object blisterHuevitos {
    
    var property huevosChocolate = 15

    method calorias(){
        return (huevosChocolate * 100) + self.caloriasHuevosExtras()
    }

    method caloriasHuevosExtras(){

        return self.huevosExtraChocolateBlanco() * 150
    }

    method huevosExtraChocolateBlanco(){
        return huevosChocolate.div(5)
    }

    method tieneChocolateBlanco() = (self.huevosExtraChocolateBlanco() > 0)

}

object matrioshka {

    var property huevoAdentro = conejo
    var property decoracion = flor

    method calorias(){
        return 3000 +  ( huevoAdentro.calorias() + flor )
    }

    method tieneChocolateAmargo() = true
    method tieneChocolateBlanco() = huevoAdentro.tieneChocolateBlanco()
}

object flor{
    
    var property petalos = 0

    method calorias(){
        return petalos * 100
    }

    
}

object arbol{

    method calorias(){
        return 150
    }

    
}



object caceria{

    const property huevosAEncontrar = [huevoRepostero, huevoMixto, conejo, blisterHuevitos, matrioshka, huevoRepostero]

    method cantidadDeHuevosSinEncontrar(){
        return huevosAEncontrar.size()
    }

    method huevosChocoBlancoSinEncontrar(){
        return huevosAEncontrar.filter({h => h.tieneChocolateBlanco()}).size()
    }

    method talHuevoNoFueEncontrado(huevo){
        return huevosAEncontrar.contains({h => h == huevo})
    }

    method huevoConMasCalorias(){
        return self.huevosChocoBlancoSinEncontrar().max({h => h.calorias()})
    }

}   






object ana{

    const huevosComidos = []
    
    method encontrarHuevo(unHuevo){
        huevosComidos.add( caceria.huevosAEncontrar().find({h => h == unHuevo}) )
        caceria.huevosAEncontrar().remove({h => h == unHuevo})
    }

    method encontrarPrimerHuevo(){
        huevosComidos.add(caceria.huevosAEncontrar().first())
        caceria.huevosAEncontrar().remove(caceria.huevosAEncontrar().first())
    }

    method encontrarHuevosRestantes(){
        huevosComidos.add( caceria.huevosAEncontrar() )
        caceria.huevosAEncontrar().removeAll()
    }

    method estaEnfermo(){
        return huevosComidos.sum({h => h.calorias()}) > 5000 || self.comioChocolateBlanco()
    }

    method comioChocolateBlanco(){
        return huevosComidos.any({h => h.tieneChocolateBlanco()})
    }
}

object jose{

    var ultimoHuevoComido = huevoMixto

    method encontrarHuevo(unHuevo){
        ultimoHuevoComido = ( caceria.huevosAEncontrar().find({h => h == unHuevo}) )
        caceria.huevosAEncontrar().remove({h => h == unHuevo})
    }

    method encontrarPrimerHuevo(){
        ultimoHuevoComido = (caceria.huevosAEncontrar().first())
        caceria.huevosAEncontrar().remove(caceria.huevosAEncontrar().first())
    }

    method encontrarHuevosRestantes(){
        ultimoHuevoComido = ( caceria.huevosAEncontrar() )
        caceria.huevosAEncontrar().removeAll()
    }

    method estaEnfermo(){
        return ultimoHuevoComido.tieneChocolateAmargo()
    }
}

object tito{

    method estaEnfermo(){

    }
}

