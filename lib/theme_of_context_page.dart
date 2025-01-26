import 'package:flutter/material.dart';

class ThemeOfContextPage extends StatelessWidget {
  const ThemeOfContextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theme.of(context)')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.center,
              width: 200,
              height: 200,
              // この context はbuild関数の引数なので、
              // -> red
              color: Theme.of(context).primaryColor,
              child: Text('contextが紐づくwidget : ${context.widget.toString()}'),
            ),
            Theme(
              data: ThemeData(primaryColor: Colors.blue),
              child: Container(
                alignment: Alignment.center,
                width: 200,
                height: 200,
                color: Theme.of(context).primaryColor,
                // この context はbuild関数の引数なので、
                // Theme で primaryColor 指定してるけれど使用されるのは
                // -> red
                child: Text('contextが紐づくwidget : ${context.widget.toString()}'),
              ),
            ),
            Theme(
              data: ThemeData(primaryColor: Colors.blue),
              child: Builder(
                builder: (BuildContext context) {
                  return Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 200,
                    // この context は Builder で新しく作られた BuildContextなので、
                    // -> blue
                    color: Theme.of(context).primaryColor,
                    child: Text('contextが紐づくwidget : ${context.widget.toString()}'),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
