void Reloj() {
  milisegundos = milisegundos+1;
  if (milisegundos >=99) {
    segundos = segundos +1;
    milisegundos = 0;
  }
  if (segundos >=59) {
    minutos = minutos +1;
    segundos = 0;
  }
}

void DibujaReloj() {
  String tiempo = nf(minutos, 2)+ ":" + nf(segundos, 2)+ ":" + nf(milisegundos, 2);
  text(tiempo, 750,790 );
}
