import personas.*
import construcciones.*

class Planeta{
    const personas = []
    const construcciones = []

    method delegacionDiplomatica() = personas.filter{persona=>persona.esDestacada() or self.personaConMasRecursos()}
    method personaConMasRecursos() = personas.max{persona=>persona.recursos()}
    method esValioso() = construcciones.sum{construccion=>construccion.calcularValor()} > 100
    method vive(persona) = personas.contains(persona)
    method agregarConstruccion(construccion) {construcciones.add(construccion)}

    method delegacionTrabajaEnCasa(tiempo) = self.delegacionDiplomatica().forEach{persona=>persona.trabajar(self,tiempo)}
    method invadir(planeta,tiempo) = self.delegacionTrabajaEn(planeta,tiempo)
    method delegacionTrabajaEn(planeta,tiempo) = self.delegacionDiplomatica().forEach{persona=>persona.trabajar(planeta,tiempo)}
}