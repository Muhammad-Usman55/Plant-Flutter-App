import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/main.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getLocalizedText('settings'),
          style: TextStyle(
            color: Constants.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Constants.primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getLocalizedText('language'),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            const SizedBox(height: 16),
            _buildLanguageOption('English', 'en'),
            _buildLanguageOption('اردو', 'ur'),
            const SizedBox(height: 32),
            Text(
              getLocalizedText('appearance'),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            const SizedBox(height: 16),
            _buildThemeToggle(),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption(String language, String code) {
    final isSelected = localeNotifier.value.languageCode == code;
    return GestureDetector(
      onTap: () {
        setState(() {
          localeNotifier.value = Locale(code);
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? Constants.primaryColor.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? Constants.primaryColor
                : Theme.of(context).dividerColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              language,
              style: TextStyle(
                fontSize: 16,
                color: isSelected
                    ? Constants.primaryColor
                    : Theme.of(context).textTheme.bodyLarge?.color,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: Constants.primaryColor,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeToggle() {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, themeMode, child) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Theme.of(context).dividerColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getLocalizedText('darkMode'),
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
              Switch(
                value: themeMode == ThemeMode.dark,
                activeColor: Constants.primaryColor,
                onChanged: (value) {
                  themeNotifier.value = value ? ThemeMode.dark : ThemeMode.light;
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

