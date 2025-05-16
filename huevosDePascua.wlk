object huevoRepostero {

    method calorias(){
        return 750
    }

    method tieneChocolateBlanco() = true
    method tieneChocolateAmargo() = false
}

object huevoMixto {
  
  method calorias(){
    return 900
  }

  method tieneChocolateBlanco() = true
  method tieneChocolateAmargo() = false
}

object conejo {

    var property peso = 0

    method calorias(){
        return (peso * 10)
    }
    
    method tieneChocolateAmargo() = true
    method tieneChocolateBlanco() = false
}

object blisterHuevitos {
    
    var property huevosChocolate = 14

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
    method tieneChocolateAmargo() = false

}

object matrioshka {

    var property huevoAdentro = blisterHuevitos
    var property decoracion = flor

    method calorias(){
        return 3000 +  ( huevoAdentro.calorias() + decoracion.calorias() )
    }

    method tieneChocolateAmargo() = true
    method tieneChocolateBlanco() = huevoAdentro.tieneChocolateBlanco()
}

object flor{
    
    var property petalos = 7

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

    const property huevosAEncontrar = [matrioshka, huevoRepostero, conejo, huevoMixto]

    method cantidadDeHuevosSinEncontrar(){
        return huevosAEncontrar.size()
    }

    method cantidadHuevosChocoBlancoSinEncontrar(){
        return huevosAEncontrar.filter({h => h.tieneChocolateBlanco()}).size()
    }

    method talHuevoNoFueEncontrado(huevo){
        return huevosAEncontrar.contains(huevo)
    }

    method huevosChocoBlancoSinEncontrar(){
       return huevosAEncontrar.filter({h => h.tieneChocolateBlanco()})
    }

    method huevoConMasCalorias(){
        return self.huevosChocoBlancoSinEncontrar().max({h => h.calorias()})
    }

}   






object ana{

    const property huevosComidos = []
    
    method encontrarHuevo(unHuevo){
        huevosComidos.add( caceria.huevosAEncontrar().find({h => h == unHuevo}) )
        caceria.huevosAEncontrar().remove({h => h == unHuevo})
    }

    method encontrarPrimerHuevo(){
        huevosComidos.add(caceria.huevosAEncontrar().first())
        caceria.huevosAEncontrar().remove(caceria.huevosAEncontrar().first())
    }

    method encontrarHuevosRestantes(){
        huevosComidos.addAll( caceria.huevosAEncontrar() )
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
        ultimoHuevoComido = conejo
        caceria.huevosAEncontrar().clear()
    }

    method estaEnfermo(){
        return ultimoHuevoComido.tieneChocolateAmargo()
    }
}

object tito{

    method encontrarHuevo(unHuevo){
    
        caceria.huevosAEncontrar().remove({h => h == unHuevo})
    }

    method encontrarPrimerHuevo(){
        
        caceria.huevosAEncontrar().remove(caceria.huevosAEncontrar().first())
    }

    method encontrarHuevosRestantes(){
        
        caceria.huevosAEncontrar().removeAll()
    }
    
    
    
    
    method estaEnfermo(){
    
    }
}

