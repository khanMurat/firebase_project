import 'package:firebase_project/core/enums/cache_key_enum.dart';
import 'package:firebase_project/core/init/cache/cache_manager.dart';
import 'package:flutter/material.dart';

// Cache işlemleri için deneme sayfası

class CacheView extends StatefulWidget {
  const CacheView({Key? key}) : super(key: key);

  @override
  State<CacheView> createState() => _CacheViewState();
}

class _CacheViewState extends State<CacheView> {
  late CacheManager _manager;

  String _counter = '';

  @override
  void initState() {
    _manager = CacheManager.instance;
    super.initState();
  }

  Future<void> saveCounter() async {
    await _manager.saveString(CacheKeys.counter, _counter);
    print(_counter);
  }

  String? getString() {
    return _manager.getString(CacheKeys.counter);
  }

  Future<void> clear() async {
    await _manager.clearAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getString().toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await clear();
        },
        child: Icon(Icons.save),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              _counter.toString(),
            ),
          ),
          TextFormField(
            onChanged: (value) {
              setState(() {
                _counter = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
