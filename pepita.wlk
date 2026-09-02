object pepita {
  var energia = 100
  method volar(metros) {
    self.validarVolar(metros)
    energia = energia - 10 - (metros / 10)
  }
  method validarVolar(metros){
    if (not self.puedeVolar(metros) ){
      self.error("Pepita no tiene energia para volar " + metros + " metros")
    }
  }
  method puedeVolar(metros){
    return (energia - 10 - (metros / 10)) >= 30 
  }
  method descansar() {
    energia = energia + 10
  }
  method estaCansada() {
    return energia < 30
  }
  method comer(alpiste) {
    energia = energia + alpiste.energiaAporta()
  }
  method energia(_energia){
    energia = _energia
  }
  method energia(){
    return energia
  }
}
object alpiste {
  method energiaAporta() {
    return 25
  }
}
object manzana {
  const caloriasBase = 20
  var madurez = 1
  method energiaAporta(){
    return caloriasBase * self.escala()
  }
  method escala() {
    return if(madurez < 3){
      madurez
    }
    else{0}
  }
}
object pepon {
  var energia = 30
  var ultimoAlimento = manzana
  method comer(alimento) {
    self.validarAlimento(alimento)
    energia = energia + (alimento.energiaAporta() / 2)
    ultimoAlimento = alimento 
  }
  method validarAlimento(alimento){
    if(alimento == ultimoAlimento){
      self.error("No puede comer " + alimento + " nuevamente")
    }
  }
  method volar(km) {
    energia = energia - 20 - (km * 2) 
  }
  method estaCansado() {
    return energia < 34
  }
  method energia(_energia){
    energia = _energia
  }
  method energia(){
    return energia
  }
}
object rebeca {
  var ave = pepon
  var cantidadCenas = 0
  method alimentar(alimento) {
    ave.comer(alimento)
    cantidadCenas = cantidadCenas + 1
  }
  method entrenar(mascota) {
    cantidadCenas = 0
  }
  method cenas() {
    return cantidadCenas
  }
}