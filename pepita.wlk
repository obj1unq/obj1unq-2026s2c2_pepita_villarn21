object pepita {
  var energia = 100
  
  method volar(metros) {
    energia = energia - 10 - (metros / 10)
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
  method comer(alpiste) {
    energia = energia + (alpiste.energiaAporta() / 2) 
  }
  method volar(km) {
    energia = energia - 20 - (km * 2) 
  }
  method estaCansado() {
    return energia < 34
  }
}
object rebeca {
  var ave = pepon
  var cantidadCenas = 0
  method alimentar(alpiste) {
    ave.comer(alpiste)
    cantidadCenas = cantidadCenas + 1
  }
  method entrenar(mascota) {
    cantidadCenas = 0
  }
  method cenas() {
    return cantidadCenas
  }
}