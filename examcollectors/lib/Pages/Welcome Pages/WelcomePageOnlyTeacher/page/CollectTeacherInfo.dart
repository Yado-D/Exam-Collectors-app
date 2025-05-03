import 'package:examcollectors/Pages/Welcome%20Pages/WelcomePageOnlyTeacher/teacher_info_bloc.dart';
import 'package:examcollectors/utils/AppColorCollections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CollectTeacherInfo extends StatefulWidget {
  const CollectTeacherInfo({super.key});

  @override
  State<CollectTeacherInfo> createState() => _CollectTeacherInfoState();
}

class _CollectTeacherInfoState extends State<CollectTeacherInfo> {
  final _formKey = GlobalKey<FormState>();
  List<String> teacherAch = [];
  String achivment = '';
  String biography = '';
  final TextEditingController _biographyController = TextEditingController();
  final TextEditingController _achievementController = TextEditingController();

  @override
  void dispose() {
    _biographyController.dispose();
    _achievementController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: ColorCollections.PageColor,
      appBar: AppBar(
        title: const Text('Teacher Profile Setup'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Biography Section
              Text(
                'Professional Biography',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: ColorCollections.TextColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Tell students about your background and expertise',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Example:',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'I am a mathematics professional with a strong background in research and education. Having earned my PhD in Mathematics, I am deeply passionate about exploring complex problems and fostering innovative solutions.',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _biographyController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Enter your professional biography',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: theme.colorScheme.outline,
                    ),
                  ),
                  filled: true,
                  fillColor: isDarkMode
                      ? theme.colorScheme.surfaceVariant
                      : theme.colorScheme.surface,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your biography';
                  }
                  return null;
                },
                onChanged: (value) => biography = value,
              ),
              const SizedBox(height: 32),

              // Achievements Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Achievements',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorCollections.TextColor,
                    ),
                  ),
                  IconButton(
                    onPressed: _showAddAchievementDialog,
                    icon: Icon(
                      Icons.add_circle,
                      color: theme.colorScheme.primary,
                      size: 32,
                    ),
                    tooltip: 'Add achievement',
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Add any awards, publications, or notable accomplishments',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 16),
              if (teacherAch.isEmpty)
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        'No achievements added yet',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                    ),
                  ),
                )
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: teacherAch.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 1,
                      margin: const EdgeInsets.only(bottom: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        title: Text(
                          teacherAch[index],
                          style: theme.textTheme.bodyMedium,
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: theme.colorScheme.error,
                          ),
                          onPressed: () {
                            setState(() {
                              teacherAch.removeAt(index);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Achievement removed',
                                  style: TextStyle(
                                    color: theme.colorScheme.onError,
                                  ),
                                ),
                                backgroundColor: theme.colorScheme.error,
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              const Spacer(),
              GestureDetector(
                  onTap: _submitForm,
                  child: Container(
                    height: 50,
                    // width: 150,
                    margin: EdgeInsets.only(),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/Images/ButtonColor.jpg'),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 28,
                          color: ColorCollections.WhiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddAchievementDialog() {
    final theme = Theme.of(context);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Add Achievement',
            style: theme.textTheme.titleLarge,
          ),
          content: TextFormField(
            controller: _achievementController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'e.g., Published research on...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onChanged: (value) => achivment = value,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (achivment.isNotEmpty) {
                  setState(() {
                    teacherAch.add(achivment);
                    _achievementController.clear();
                    achivment = '';
                  });
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Please enter an achievement',
                        style: TextStyle(
                          color: theme.colorScheme.onError,
                        ),
                      ),
                      backgroundColor: theme.colorScheme.error,
                    ),
                  );
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (teacherAch.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please add at least one achievement'),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }

      // Submit to BLoC
      context.read<TeacherInfoBloc>().add(
            teacherInfo(
              biography: biography,
              achivment: teacherAch,
            ),
          );

      Navigator.of(context).pushNamed('/welcome_page3');
    }
  }
}
