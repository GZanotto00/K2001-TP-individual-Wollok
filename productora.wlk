import exceptions.*
import asistente.*
import abonos.*
import banda.*
import entrada.*

object productora {
    var property impuestoEntradas = 10
    const asistentes = #{}
    const bandasQueTrabaja = #{}
    
    method registrarVenta(asistente, banda) {
        if (!bandasQueTrabaja.any({ bandaDeLaProductora => bandaDeLaProductora == banda }))
            throw new BandaNoEsTraidaException(message = "La productora no trae esa banda")

        asistentes.add(asistente)
    }

    method traer(banda) {
        bandasQueTrabaja.add(banda)
    }

    method bonificar(asistente) {
        asistente.bonificar()
    }

    method gananciaTotal() {
        const ingresos = self.entradasVendidas().sum({ entrada => entrada.precio() })
        const gastos = bandasQueTrabaja.sum({ banda => banda.presupuesto() })

        return ingresos - gastos
    }
    
    method entradasVendidas() = asistentes.flatMap({ asistente => asistente.historialDeEntradas() })

    method cantidadEntradasVendidas() = self.entradasVendidas().size()

    method bandaMasPopular() = self.bandasConVentas().max({ banda => self.entradasVendidas().filter({ entrada => entrada.banda() == banda}).size() })

    method bandasConVentas() = self.entradasVendidas().map({ entrada => entrada.banda() }).asSet()
}

const asistente = new Asistente(abono = abonoFan, dinero = 1000000)

const banda1 = new BandaDeRock(solosDeGuitarra = 10, nombre = "La coja")
const banda2 = new BandaDeTrap(tieneHielo = true, nombre = "Fácil B")
const banda3 = new BandaIndie(cantidadInstrumentos = 5, nombre = "El revivió a un oficial en carreta")