import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:sqflite/sqflite.dart';
import 'database.dart';

Map<String, Color> predefinedCategoryColors = {
  'Entertainment': Colors.red,
  'Food': Colors.green,
  'Bills': Colors.blue,
};
Map<String, Color> categoryColors = {};

class FinancialReportPage extends StatefulWidget {
  @override
  _FinancialReportPageState createState() => _FinancialReportPageState();
}

class _FinancialReportPageState extends State<FinancialReportPage> {
  String selectedPeriod = 'Month';
  List<Map<String, dynamic>> categoryWiseExpenses = [];
  double totalExpenses = 0.0;
  Map<String, double> dataMap = {};

  @override
  void initState() {
    super.initState();
    loadCategoryWiseExpenses();
  }

  Future<void> loadCategoryWiseExpenses() async {
    final data = await fetchCategoryWiseExpenses();
    setState(() {
      categoryWiseExpenses = data;
      totalExpenses = categoryWiseExpenses.fold(
        0.0,
        (sum, item) => sum + (item['totalAmount'] as double),
      );
      assignColorsToCategories();
      updateDataMap();
    });
  }

  void assignColorsToCategories() {
    for (var expense in categoryWiseExpenses) {
      final category = expense['category'] as String;
      if (!categoryColors.containsKey(category)) {
        categoryColors[category] = predefinedCategoryColors[category] ??
            Colors.grey; // Default color if not predefined
      }
    }
  }

  void updateDataMap() {
    dataMap = {
      for (var expense in categoryWiseExpenses)
        expense['category'] as String: expense['totalAmount'] as double,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBE8E8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Financial Report',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: DropdownButton<String>(
                value: selectedPeriod,
                items: <String>['Month', 'Week', 'Year'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedPeriod = value!;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              flex: 3,
              child: Center(
                child: dataMap.isNotEmpty
                    ? PieChart(
                        dataMap: dataMap,
                        colorList: categoryColors.values.toList(),
                        chartType: ChartType.ring,
                        animationDuration: const Duration(milliseconds: 800),
                        chartValuesOptions: const ChartValuesOptions(
                          showChartValuesInPercentage: true,
                          showChartValuesOutside: true,
                        ),
                        centerText: "Expenses",
                        chartRadius: MediaQuery.of(context).size.width / 3.2,
                      )
                    : const Text(
                        'No data to display',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              flex: 5,
              child: ListView.builder(
                itemCount: categoryWiseExpenses.length,
                itemBuilder: (context, index) {
                  final expense = categoryWiseExpenses[index];
                  final category = expense['category'];
                  final amount = expense['totalAmount'] as double;
                  final progress = amount / totalExpenses;
                  final color = categoryColors[category]!;

                  return ExpenseItem(
                    title: category,
                    amount: amount.toStringAsFixed(2),
                    color: color,
                    progress: progress,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpenseItem extends StatelessWidget {
  final String title;
  final String amount;
  final Color color;
  final double progress;

  const ExpenseItem({
    required this.title,
    required this.amount,
    required this.color,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              Text(
                '- ₹$amount',
                style: const TextStyle(
                    fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ],
      ),
    );
  }
}

Future<List<Map<String, dynamic>>> fetchCategoryWiseExpenses() async {
  final db = await initializeDatabase();
  final result = await db.rawQuery('''
    SELECT category, SUM(amount) as totalAmount 
    FROM transactions 
    GROUP BY category
  ''');
  return result;
}
