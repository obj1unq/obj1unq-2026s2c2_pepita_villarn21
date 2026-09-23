import wollok.game.*
object pepita {
  var energia = 100
  method volar(metros) {
    self.validarVolar(metros)
    energia = self.gastoEnergiaVolar(metros)
  }
  method gastoEnergiaVolar(metros){
    return energia - 10 - (metros / 10)
  }
  method validarVolar(metros){
    if (not self.puedeVolar(metros) ){
      self.error("Pepita no tiene energia para volar " + metros + " metros")
    }
  }
  method puedeVolar(metros){
    return self.gastoEnergiaVolar(metros) >= 30 
  }
  method descansar() {
    energia = energia + 10
  }
  method estaCansada() {
    return energia < 30
  }
  method comer(alimento) {
    energia = energia + alimento.energiaAporta()
  }
  method energia(_energia){
    energia = _energia
  }
  method energia(){
    return energia
  }
}
object alpiste {
  var property position = game.at(2,3) 
  method image(){
    return "alpiste.png"
  }
  method energiaAporta() {
    return 25
  }
}
object manzana {
  const caloriasBase = 20
  var madurez = 1
  var property position = game.at(8,4)
  method image(){
    return "manzana.png"
  } 
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
  method comer(alpiste) {
    energia = energia + (alpiste.energiaAporta() / 2) 
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