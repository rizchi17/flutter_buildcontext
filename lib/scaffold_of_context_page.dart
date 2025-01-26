import 'package:flutter/material.dart';

class ScaffoldOfContextPage extends StatefulWidget {
  const ScaffoldOfContextPage({super.key});

  @override
  State<ScaffoldOfContextPage> createState() => _ScaffoldOfContextPageState();
}

class _ScaffoldOfContextPageState extends State<ScaffoldOfContextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scaffold.of(context)')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Builderで囲わない'),
              onPressed: () {
                Scaffold.of(context).showBottomSheet(
                  (BuildContext context) {
                    return Container(
                      alignment: Alignment.center,
                      height: 200,
                      color: Colors.amber,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const Text('BottomSheet'),
                            ElevatedButton(
                              child: const Text('Close BottomSheet'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  child: const Text('Builderで囲う'),
                  onPressed: () {
                    Scaffold.of(context).showBottomSheet(
                      (BuildContext context) {
                        return Container(
                          alignment: Alignment.center,
                          height: 200,
                          color: Colors.amber,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text('BottomSheet'),
                                ElevatedButton(
                                  child: const Text('Close BottomSheet'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
