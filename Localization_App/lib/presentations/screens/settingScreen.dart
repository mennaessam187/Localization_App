import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization_app/app_localization.dart';
import 'package:localization_app/cubit/cubit/local_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? _selectedValue; // Holds the selected value

// List of items to display in the dropdown
final List<String> dropdownItems = [
  'en',
  'ar',
];

class settingScreen extends StatefulWidget {
  const settingScreen({super.key});

  @override
  State<settingScreen> createState() => _settingScreenState();
}

class _settingScreenState extends State<settingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "settings".tr(context),
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<LocalCubit, LocalState>(
              builder: (context, state) {
                if (state is changeLocalLanguage) {
                  return DropdownButton<String>(
                      value:
                          state.local!.languageCode, // Current selected value
                      items: dropdownItems.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedValue = newValue; // Update selected value
                        });

                        // Dispatch the event to change the language using LocalCubit
                        if (_selectedValue != null) {
                          BlocProvider.of<LocalCubit>(context)
                              .changeLanguage(_selectedValue!);
                          Navigator.of(context).pop();
                        }
                      });
                }
                return SizedBox();
              },
            ),

            SizedBox(height: 20),

            // Display selected value
            BlocBuilder<LocalCubit, LocalState>(builder: (context, state) {
              if (state is changeLocalLanguage) {
                return Text(state.local!.languageCode == "ar"
                    ? "arabic".tr(context)
                    : "english".tr(context));
              }
              return Text("No item selected".tr(context));
            })
          ],
        ),
      ),
    );
  }
}
