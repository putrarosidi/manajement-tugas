class ItemModel {
  final int id;
  final String judul;
  final String deskripsi;
  final String keterangan;

  ItemModel({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.keterangan,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'] ?? 0,
      judul: json['judul'] ?? '',
      deskripsi: json['deskripsi'] ?? '',
      keterangan: json['keterangan'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'judul': judul,
    'deskripsi': deskripsi,
    'keterangan': keterangan,

  };
}