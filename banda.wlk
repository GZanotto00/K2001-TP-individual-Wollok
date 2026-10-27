class Banda {
    const nombre
    const canon = 1000000

    method nombre() = nombre
    method canon() = canon
    method gastoExtra()
    method popularidad()

    method presupuesto() = self.canon() + self.gastoExtra()
}

class BandaDeRock inherits Banda {
    const solosDeGuitarra

    override method gastoExtra() = 10000
    override method popularidad() = solosDeGuitarra * 100
}

class BandaDeTrap inherits Banda {
    const tieneHielo

    override method gastoExtra() = 0

    override method popularidad() {
        if (tieneHielo)
            return 1000

        return 0
    }

    override method canon() {
        return super() * self.popularidad()
    }
}

class BandaIndie inherits Banda {
    const cantidadInstrumentos

    override method popularidad() = nombre.size() * 3.14
    override method gastoExtra() = cantidadInstrumentos * 500
}