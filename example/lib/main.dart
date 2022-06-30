import 'package:example/bloc/carousel_bloc.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => CarouselBloc(),
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<CarouselBloc, CarouselState>(
              builder: (context, state) {
                final exampleWidgets = _createExampleWidgets(state);

                if (exampleWidgets.isEmpty) {
                  return Container();
                }

                return ExpandablePageView(
                  children: exampleWidgets,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _createExampleWidgets(CarouselState state) {
    List<Widget> exampleWidgets = [];

    if (state.showFirstCard) {
      exampleWidgets.add(ExampleWidget(Colors.lightBlue, 0, 300));
    }

    if (state.showSecondCard) {
      exampleWidgets.add(ExampleWidget(Colors.lightGreen, 1, 500));
    }

    if (state.showThirdCard) {
      exampleWidgets.add(ExampleWidget(Colors.redAccent, 2, 700));
    }

    return exampleWidgets;
  }
}

class ExampleWidget extends StatefulWidget {
  final Color color;
  final int index;
  final double height;

  const ExampleWidget(this.color, this.index, this.height);

  @override
  State<ExampleWidget> createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      color: widget.color,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Card #${widget.index + 1}',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(16.0),
              primary: Colors.black,
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () => _removeCarouselItem(widget.index),
            child: const Text('Remove me'),
          ),
        ],
      ),
    );
  }

  void _removeCarouselItem(int index) {
    switch (index) {
      case 0:
        BlocProvider.of<CarouselBloc>(context)
            .add(CarouselFirstCardDismissed());
        break;
      case 1:
        BlocProvider.of<CarouselBloc>(context)
            .add(CarouselSecondCardDismissed());
        break;
      case 2:
        BlocProvider.of<CarouselBloc>(context)
            .add(CarouselThirdCardDismissed());
        break;
    }
  }
}
