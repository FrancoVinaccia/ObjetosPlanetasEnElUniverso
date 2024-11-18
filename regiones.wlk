import construcciones.*
import personas.*

object monatania {
    method construccion(unConstructor, tiempo) = new Muralla(longitud = tiempo / 2)
}

object costa {
    method construccion(unConstructor, tiempo) = new Museo(superficieCubierta = tiempo, indiceImportancia = 1)
}

object llanura {
    method construccion(unConstructor, tiempo){
        if(unConstructor.esDestacada()) return new Museo(superficieCubierta = tiempo, indiceImportancia = unConstructor.recursos().min(5))
        else return new Muralla(longitud = tiempo / 2)
    }
}

object bosque {
    method construccion(unConstructor, tiempo){
        if(unConstructor.inteligencia() < 50) return new Museo(superficieCubierta = tiempo, indiceImportancia = 1)
        else return new Muralla(longitud = tiempo / 2)
    }
}