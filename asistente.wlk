import productora.*
import exceptions.*

class Asistente {
    var dinero
    var property abono
    const historialDeEntradas = []

    method dinero() = dinero
    method historialDeEntradas() = historialDeEntradas

    method comprar(entrada) {
        if (dinero < 0)
            throw new SaldoInsuficienteException(message = "El asistente no tiene saldo suficiente para comprar la entrada")

        productora.registrarVenta(self, entrada.banda())

        const precioParaElAsistente = abono.calcularPrecio(entrada)
        dinero -= precioParaElAsistente
        historialDeEntradas.add(entrada)
    }

    method entradasDelAnioPasado() {
        const anioPasado = new Date().year() - 1
        return historialDeEntradas.filter({ entrada => entrada.fecha().year() == anioPasado })
    }

    method bandasQueFueAVer() {
        return historialDeEntradas.map({ entrada => entrada.banda().nombre() }).asSet()
    }

    method bonificar() = abono.aumentarDescuento()
}