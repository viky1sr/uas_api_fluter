class BiodataKaryawan {
  String id;
  String nik;
  String namaKaryawan;
  String jenisKelamin;
  String tempatLahir;
  String tanggalLahir;
  String pendidikan;
  String departemen;
  String jabatan;
  String noTelepon;
  String status;
  String alamat;
  String kodepos;

  BiodataKaryawan(
      {this.id,
      this.nik,
      this.namaKaryawan,
      this.jenisKelamin,
      this.tempatLahir,
      this.tanggalLahir,
      this.pendidikan,
      this.departemen,
      this.jabatan,
      this.noTelepon,
      this.status,
      this.alamat,
      this.kodepos});

  BiodataKaryawan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nik = json['nik'];
    namaKaryawan = json['nama_karyawan'];
    jenisKelamin = json['jenis_kelamin'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
    pendidikan = json['pendidikan'];
    departemen = json['departemen'];
    jabatan = json['jabatan'];
    noTelepon = json['no_telepon'];
    status = json['status'];
    alamat = json['alamat'];
    kodepos = json['kodepos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nik'] = this.nik;
    data['nama_karyawan'] = this.namaKaryawan;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['tempat_lahir'] = this.tempatLahir;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['pendidikan'] = this.pendidikan;
    data['departemen'] = this.departemen;
    data['jabatan'] = this.jabatan;
    data['no_telepon'] = this.noTelepon;
    data['status'] = this.status;
    data['alamat'] = this.alamat;
    data['kodepos'] = this.kodepos;
    return data;
  }
}
