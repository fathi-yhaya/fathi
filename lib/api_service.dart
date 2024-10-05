import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';

class ApiService {
  final String baseUrl = 'http://192.168.246.239:7223/api';

  Future<List<Dep>> fetchDeps() async {
    final response = await http.get(Uri.parse('$baseUrl/Deps'));

    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      return jsonResponse.map((dep) => Dep.fromJson(dep)).toList();
    } else {
      throw Exception('Failed to load departments');
    }
  }

  Future<List<Emp>> fetchEmps(int depId) async {
    final response = await http.get(Uri.parse('$baseUrl/Emps'));

    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      List<Emp> emps = jsonResponse.map((emp) => Emp.fromJson(emp)).toList();
      return emps.where((emp) => emp.depId == depId).toList();
    } else {
      throw Exception('Failed to load employees');
    }
  }

  
  Future<List<Emp>> fetchAllEmps() async {
    final response = await http.get(Uri.parse('$baseUrl/Emps'));

    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      return jsonResponse.map((emp) => Emp.fromJson(emp)).toList();
    } else {
      throw Exception('Failed to load all employees');
    }
  }
}
