import entrada.*
import exceptions.*


object abonoFan {
    method calcularPrecio(entrada) = entrada.precio()

    method aumentarDescuento() = throw new IncrementarAbonoException(message = "No se puede bonificar al asistente por que su abono es Fan")
}

class AbonoVip {
    var porcentajeDescuento

    method calcularPrecio(entrada) {
        return entrada.precio() - entrada.precio() * porcentajeDescuento / 100
    }

    method aumentarDescuento() {
        porcentajeDescuento += 1
    }
}