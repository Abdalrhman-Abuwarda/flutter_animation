import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animation/ui/stopwatch.dart';
import 'pages/animated_container_page.dart';
import 'pages/animated_opacity_page.dart';
import 'pages/tween_animation_builder_page.dart';

enum AnimationExample {
  animatedContainer,
  animatedOpacity,
  tweenAnimationBuilder,
}

extension on AnimationExample {
  String capitalizeFirstCharacter() {
    final name = describeEnum(this);
    return name.replaceRange(0, 1, name.characters.first.toUpperCase());
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: MyHomePage(),
      //
      // Scaffold(
      //   appBar: AppBar(title: const Text('Animations Playground')),
      //   body: AnimationExamplesList(),
      // ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case 'animatedContainer':
            return MaterialPageRoute(
                builder: (_) => const AnimatedContainerPage());
          case 'animatedOpacity':
            return MaterialPageRoute(
                builder: (_) => const AnimatedOpacityPage());
          case 'tweenAnimationBuilder':
            return MaterialPageRoute(
                builder: (_) => TweenAnimationBuilderPage());
          default:
            throw UnimplementedError('Route ${settings.name} not implemented');
        }
      },
    );
  }
}

class AnimationExamplesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final example = AnimationExample.values[index];
        final routeName = describeEnum(example);
        return ListTile(
          title: Text(example.capitalizeFirstCharacter()),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => Navigator.of(context).pushNamed(routeName),
        );
      },
      itemCount: AnimationExample.values.length,
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: AspectRatio(
              aspectRatio: 0.85,
              child: StopwatchScreen(),
            ),
          ),
        ),
      ),
    );
  }
}
