import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({Key? key}) : super(key: key);

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  GlobalKey<FormState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        autovalidateMode: AutovalidateMode.always,
        onChanged: () {},
        child: Column(
          children: [
            TextFormField(validator: FormFieldValidator().isNotEmpty,),
            TextFormField(validator: FormFieldValidator().isNotEmpty,),

            DropdownButtonFormField<String>(
                validator: FormFieldValidator().isNotEmpty,
                items: const [
              DropdownMenuItem(value: 'v', child: Text('a'),),
              DropdownMenuItem(value: 'v2', child: Text('a'),),
              DropdownMenuItem(value: 'v3', child: Text('a'),),
            ], onChanged: (value) {}),

            CheckboxListTile(value: true, onChanged: (value){}),

            ElevatedButton(
                onPressed: () {
                  if (_key.currentState?.validate() ?? false) {
                    debugPrint('okey');
                  }
                },
                child: const Text('Save'))
          ],
        ),
      ),
    );
  }
}

class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false)
        ? null
        : ValidatorMessage._notEmptyMessage;
  }
}

class ValidatorMessage {
  static const String _notEmptyMessage = 'Boş geçilemez';
}
