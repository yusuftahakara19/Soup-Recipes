class Corba {
  String _corbaAdi;
  String _corbaDetayi;
  String _corbaKucukResim;
  String _corbaBuyukResim;

  Corba(this._corbaAdi, this._corbaDetayi, this._corbaKucukResim,
      this._corbaBuyukResim);

  String get corbaBuyukResim => _corbaBuyukResim;

  set corbaBuyukResim(String value) {
    _corbaBuyukResim = value;
  }

  String get corbaKucukResim => _corbaKucukResim;

  set corbaKucukResim(String value) {
    _corbaKucukResim = value;
  }

  String get corbaDetayi => _corbaDetayi;

  set corbaDetayi(String value) {
    _corbaDetayi = value;
  }

  String get corbaAdi => _corbaAdi;

  set corbaAdi(String value) {
    _corbaAdi = value;
  }
}
