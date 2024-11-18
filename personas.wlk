import planetas.*
import tecnicas.*
import regiones.*


class Persona {
  var monedas = 20
  var edad

  method esDestacada() = monedas > 30 or (edad > 18 and edad < 65)
  method ganarMonedas(cantidad) {monedas += cantidad}
  method perderMonedas(cantidad) {monedas -= cantidad}
  method cumplirAnios() {edad += 1}
  method recursos() = monedas
  method trabajar(planeta,tiempo)
}

class Productor inherits Persona {
  var tecnicas = [cultivo]
  override method recursos() = monedas * tecnicas.size()
  override method esDestacada() = super() or tecnicas.size() > 5
  method conoceTecnica(tecnica) = tecnicas.contains(tecnica)
  method aprenderTecnica(tecnica) = tecnicas.add(tecnica)

  method realizarTecnicaDurante(tecnica,tiempo){
    if (self.conoceTecnica(tecnica)){
      self.ganarMonedas(tiempo*3)
    }
    else self.perderMonedas(1)
  }

  override method trabajar(planeta,tiempo){
    if(planeta.vive(self)){
      self.realizarTecnicaDurante(tecnicas.last(),tiempo)
    }
  }
}

class Constructor inherits Persona {
  var cantConstrucciones
  const region
  const property inteligencia 

  override method recursos() = monedas + cantConstrucciones*10
  override method esDestacada() = cantConstrucciones > 5

  method agregarConstruccion(){cantConstrucciones += 1}

  override method trabajar(planeta,tiempo){
    planeta.agregarConstruccion(region.construccion(self,tiempo))
    self.perderMonedas(5)
    self.agregarConstruccion()
  }
}