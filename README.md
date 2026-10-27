# TP Individual Wollok - Zanotto

## Decisiones

- Los abonos funcionan mediante composicion. Un asistente tiene su abono, que puede ser fan o vip. El fan no requiere estado pero el VIP si, para mantener el porcentaje de bonificacion. Por eso el fan es un WKO y el VIP una clase. Ambos entienden la misma interfaz.

- Las excepciones no se catchean a proposito. Me parece que tiene mas sentido dejar que rompa el mensaje que atraparlo y manejarlo silenciosamente.

- El impuesto lo decide la productora. Las entradas mandan un mensaje para conocerlo.

- Algo que no esta en el enunciado pero lo agregue es que antes de vender una entrada, la productora chequea si trabaja la banda. Esto lo hice por que el enunciado especifica *"Tener en cuenta que la productora trabaja con bandas que pueden no haber vendido entradas aún."*. Para lograr eso, la productora debe guardar registro de las bandas que trabaja y no vendio entradas aun. Como no queria que la productora pueda vender entradas de bandas que no trabaja, agregue la validacion.

## Conceptos de la materia utilizados:  

### Herencia

Las bandas heredan de una superclase 'Banda' que define el comportamiento base que comparten. BandaDeTrap hace un override del metodo canon y utiliza super para acceder a su valor y multiplicarlo por la popularidad

### Composicion

Los tipos de abono para cada asistente se manejan mediante composicion. Si hubiese creado un AsistenteFan y AsistenteVip mediante herencia, un asistente no podria cambiar su abono.

### Manejo de errores 

Hay instancias donde el programa debe notificar que no se puede completar el mensaje enviado. Cuando el cliente no tiene saldo suficiente para comprar una entrada, cuando se intenta bonificar a un abono fan o cuando un asistente quiere comprar una entrada de una banda que la productora no trabaja. Las excepciones no se 'catchean' ya que no quiero que el programa continue.

### Conjuntos

La productora lleva cuenta de dos cosas: las bandas y los asistentes. Si por ejemplo, un asistente compra dos entradas, no tendria sentido contarlo en una lista como dos asistentes distintos. Por eso se utilizan conjuntos sin repetidos

### Orden superior

Para los reportes de productora se utilizaron mensajes de orden superior como map, filter, max, etc.. en las funciones bandaMasPopular, bandasConVentas, gananciaTotal