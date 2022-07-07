import 'package:flutter/material.dart';
import 'package:flutter_json_hardwareandro/202/package/launch_manager.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package/loading_bar.dart';


class PackageLearnView extends StatefulWidget {
  const PackageLearnView({Key? key}) : super(key: key);

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView> with TickerProviderStateMixin , LaunchMixin{
  final Uri _url = Uri.parse('https://flutter.dev');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).buttonTheme.colorScheme?.onSecondary,
          onPressed: (){

        //launchUrl(_url);
      }),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Safa",style: Theme.of(context).textTheme.subtitle1,),
           const SizedBox(height: 50,),
           const LoadingBar(),
        ],
      ),
    );
  }
}
