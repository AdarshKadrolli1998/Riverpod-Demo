import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_example/icon_db_model.dart';
import 'icon_model.dart';
import 'icon_provider.dart';

class RiverPodDemo extends StatefulWidget {
  const RiverPodDemo({Key? key}) : super(key: key);

  @override
  _RiverPodDemoState createState() => _RiverPodDemoState();
}

class _RiverPodDemoState extends State<RiverPodDemo> {
  late Box<IconDbModel> box;
  @override
  void dispose() {
    Hive.close;
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    box = Hive.box('IconDbModel');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiverPod Demo'),
        actions: [
          IconButton(
            onPressed: () {
              context.push('/settings');
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: IconWidget(box),
    );
  }
}

final iconSizeProvider = StateNotifierProvider<IconProvider, IconModel>(
  (ref) => IconProvider(),
);

class IconWidget extends ConsumerWidget {
  final Box<IconDbModel> box;
  const IconWidget(this.box,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int? iSize;
    Color? iColor;
    iSize = ref.watch(iconSizeProvider).sizes;
    iColor = ref.watch(iconSizeProvider).newColor;
    if (box.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(iconSizeProvider.notifier).newColorSize(
            Color(int.parse((box.get(box.keys.last)?.colorValue)!)),
            box.get(box.keys.last)?.size);
        iSize = ref.watch(iconSizeProvider).sizes;
        iColor = ref.watch(iconSizeProvider).newColor;
      });
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.headset,
              size: iSize!.toDouble() / 2,
              color: iColor,
            ),
            Icon(
              Icons.headset,
              size: iSize!.toDouble(),
              color: iColor,
            ),
            Icon(
              Icons.headset,
              size: iSize!.toDouble() / 2,
              color: iColor,
            ),
          ],
        ),
        Consumer(
          builder: (context, ref, child) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ColorButton(
                      color: Colors.red,
                      onTap: () async{
                        await box.clear();
                        ref.read(iconSizeProvider.notifier).colorIcon("Red");
                      },
                    ),
                    ColorButton(
                        onTap: () async{
                          await box.clear();
                          ref.read(iconSizeProvider.notifier).colorIcon("Blue");
                        },
                        color: Colors.blue),
                    ColorButton(
                        onTap: () async{
                          await box.clear();
                          ref
                              .read(iconSizeProvider.notifier)
                              .colorIcon("Green");
                        },
                        color: Colors.green),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ColorButton(
                        onTap: () async{
                          await box.clear();
                          ref
                              .read(iconSizeProvider.notifier)
                              .colorIcon("Orange");
                        },
                        color: Colors.orange),
                    ColorButton(
                        onTap: () async{
                          await box.clear();
                          ref
                              .read(iconSizeProvider.notifier)
                              .colorIcon("Purple");
                        },
                        color: Colors.deepPurple),
                    ColorButton(
                        onTap: () async{
                          await box.clear();
                          ref
                              .read(iconSizeProvider.notifier)
                              .colorIcon("Brown");
                        },
                        color: Colors.brown),
                  ],
                ),
              ],
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            return Slider(
              activeColor: iColor,
              inactiveColor: iColor!.withOpacity(0.3),
              value: iSize!.toDouble(),
              max: 200,
              onChanged: (value) {
                box.clear();
                ref.read(iconSizeProvider.notifier).minMaxSize((value));
              },
            );
          },
        ),
        ElevatedButton(
            onPressed: () {
              saveData(iSize, iColor);
            },
            child: const Text('save')),
      ],
    );
  }
  saveData(
      int? iSize,
      Color? iColor
      ){
    final iconDb = IconDbModel()
      ..colorValue = iColor!.value.toString()
      ..size = iSize!;
    box.add(iconDb);
  }
}

class ColorButton extends StatelessWidget {
  final Color? color;
  final Function()? onTap;
  const ColorButton({Key? key, this.onTap, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 25,
        width: 25,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: color),
      ),
    );
  }
}
