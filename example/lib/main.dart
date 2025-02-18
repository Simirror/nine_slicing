import 'package:flutter/material.dart';
import 'package:nine_slicing/nine_slicing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nine Slice Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/single': (context) => const SingleDemoPage(),
        '/grid': (context) => const GridDemoPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nine Slice Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/single'),
              child: const Text('单图演示'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/grid'),
              child: const Text('网格演示'),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleDemoPage extends StatefulWidget {
  const SingleDemoPage({super.key});

  @override
  State<SingleDemoPage> createState() => _SingleDemoPageState();
}

class _SingleDemoPageState extends State<SingleDemoPage> {
  double leftSlice = 10.0;
  double rightSlice = 10.0;
  double topSlice = 10.0;
  double bottomSlice = 10.0;
  double width = 200.0;
  double height = 100.0;
  double padding = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('单图演示'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: NineSliceImage(
                imagePath: 'assets/panel-border-000.png',
                width: width,
                height: height,
                leftSlice: leftSlice,
                rightSlice: rightSlice,
                topSlice: topSlice,
                bottomSlice: bottomSlice,
                padding: padding,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildSlider('宽度', width, 50, 400,
                    (value) => setState(() => width = value)),
                _buildSlider('高度', height, 50, 400,
                    (value) => setState(() => height = value)),
                _buildSlider('左边切片', leftSlice, 0, 50,
                    (value) => setState(() => leftSlice = value)),
                _buildSlider('右边切片', rightSlice, 0, 50,
                    (value) => setState(() => rightSlice = value)),
                _buildSlider('顶部切片', topSlice, 0, 50,
                    (value) => setState(() => topSlice = value)),
                _buildSlider('底部切片', bottomSlice, 0, 50,
                    (value) => setState(() => bottomSlice = value)),
                _buildSlider('内边距', padding, 0, 50,
                    (value) => setState(() => padding = value)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlider(String label, double value, double min, double max,
      ValueChanged<double> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: 50,
          label: value.round().toString(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class GridDemoPage extends StatelessWidget {
  const GridDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('网格演示'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: 30,
        itemBuilder: (context, index) {
          return NineSliceImage(
            imagePath:
                'assets/panel-border-${index.toString().padLeft(3, '0')}.png',
            width: 60,
            height: 60,
            leftSlice: 20,
            rightSlice: 20,
            topSlice: 20,
            bottomSlice: 20,
          );
        },
      ),
    );
  }
}
