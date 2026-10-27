import productora.*

class Entrada {
    const banda
    const precioBase = 1000
    const fecha

    method fecha() = fecha
    method banda() = banda

    method precio() = precioBase + productora.impuestoEntradas()
}