import 'package:flutter/material.dart';
import 'api_service.dart';
import 'models.dart';

class AllEmpsList extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0E6D2),
      appBar: AppBar(
        backgroundColor: Color(0xFFF0E6D2),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'جميع الطلاب',
          style: TextStyle(
            color: Colors.red,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<List<Emp>>(
        future: apiService.fetchAllEmps(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            );
          } else if (snapshot.hasData) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(40.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'الطلاب',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(16),
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 9.0),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Name',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('Created Date',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('IsPresent',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      ...snapshot.data!.map((emp) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 9.0),
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(emp.name, textAlign: TextAlign.right),
                              Text(
                                emp.createdDate
                                    .toIso8601String()
                                    .split('T')
                                    .first,
                                textAlign: TextAlign.right,
                              ),
                              Checkbox(
                                value: emp.isPresent,
                                onChanged: (bool? value) {},
                                checkColor: Colors.green,
                                activeColor: Colors.white,
                                side: BorderSide(color: Colors.black, width: 2),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: Text(
                'لا توجد سجلات متاحة.',
                style: TextStyle(color: Colors.black54, fontSize: 18),
              ),
            );
          }
        },
      ),
    );
  }
}
