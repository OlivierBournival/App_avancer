class NumberInfo {
  final int nombre;
  final String description;
  final String representation;

  NumberInfo({
    required this.nombre,
    required this.description,
    required this.representation,
  });

  factory NumberInfo.fromJson(Map<String, dynamic> json) {
    return NumberInfo(
      nombre: json['nombre'],
      description: json['description'],
      representation: json['representation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'description': description,
      'representation': representation,
    };
  }
}