class Dep {
  final int id;
  final String name;


  Dep({
    required this.id,
    required this.name,
   
  });

  factory Dep.fromJson(Map<String, dynamic> json) => Dep(
        id: json['id'],
        name: json['name'],
       
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
       
      };
}

class Emp {
  final int id;
  final String name;
  final DateTime createdDate;
  final bool isPresent;
  final int depId;

  Emp({
    required this.id,
    required this.name,
    required this.createdDate,
    required this.isPresent,
    required this.depId,
  });

  factory Emp.fromJson(Map<String, dynamic> json) => Emp(
        id: json['id'],
        name: json['name'],
        createdDate: DateTime.parse(json['createdDate']),
        isPresent: json['isPresent'],
        depId: json['depId'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'createdDate': createdDate.toIso8601String(),
        'isPresent': isPresent,
        'depId': depId,
      };
}



