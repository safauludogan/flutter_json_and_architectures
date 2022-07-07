import 'package:flutter/material.dart';
import 'package:flutter_json_hardwareandro/202/image_learn_202.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({Key? key}) : super(key: key);

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> with ProductSheetMixin {
  Color _backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: _backgroundColor,
      body: Center(
          child: TextButton(
              onPressed: () {
                showCustomSheet(context, const ImageLearn202());
              },
              child: const Text('Show'))),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              context: context,
              builder: (context) {
                return const _CustomSheet();
              });

          if (result is bool) {
            setState(() {
              _backgroundColor = Colors.purple;
            });
          }
        },
        child: const Icon(
          Icons.share,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _CustomSheet extends StatefulWidget {
  const _CustomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<_CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<_CustomSheet> {
  final double _gripHeight = 30;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: _gripHeight,
            child: Stack(
              children: [
                Positioned(
                    top: 5,
                    right: 10,
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.close))),
                Divider(
                  color: Colors.black26,
                  thickness: 2,
                  indent: MediaQuery.of(context).size.width * 0.45,
                  endIndent: MediaQuery.of(context).size.width * 0.45,
                ),
              ],
            ),
          ),
          const Text('Safa2'),
          Image.network(
            'https://picsum.photos/200',
            height: 200,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {});
                Navigator.of(context).pop<bool>(true);
              },
              child: const Text('OK'))
        ],
      ),
    );
  }
}

mixin ProductSheetMixin {
  Future<T?> showCustomSheet<T>(BuildContext context, Widget child) async {
    return showModalBottomSheet<T>(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return _CustomMainSheet(
            child: child,
          );
        });
  }
}

class _CustomMainSheet extends StatelessWidget {
  const _CustomMainSheet({Key? key, required this.child}) : super(key: key);
  final Widget child;
  final double _gripHeight = 30;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _BaseSheetHeader(),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class _BaseSheetHeader extends StatelessWidget {
  const _BaseSheetHeader({
    Key? key,
  })  : _gripHeight = 50.0,
        super(key: key);

  final double _gripHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _gripHeight,
      child: Stack(
        children: [
          Positioned(
              top: MediaQuery.of(context).size.width * 0.01,
              right: MediaQuery.of(context).size.width * 0.01,
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close))),
          Divider(
            color: Theme.of(context).colorScheme.onBackground,
            thickness: 2,
            indent: MediaQuery.of(context).size.width * 0.45,
            endIndent: MediaQuery.of(context).size.width * 0.45,
          ),
        ],
      ),
    );
  }
}

class PaddingManager{

}
