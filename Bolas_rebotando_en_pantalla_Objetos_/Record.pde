void Record() {
  if (RecordMils < milisegundos) {
    RecordMils = milisegundos;
  }
  if (RecordSeg < segundos) {
    RecordSeg = segundos;
  }
  if (RecordMin < minutos) {
    RecordMin = minutos;
  }
}
