import 'package:dzidzai_mobile/components/lessons/writing_card.dart';
import 'package:dzidzai_mobile/data/writing/free_composition_practice.dart';
import 'package:dzidzai_mobile/data/writing/guided_composition_practice.dart';
import 'package:dzidzai_mobile/screens/lessons/reading/practice_tiles.dart';
import 'package:dzidzai_mobile/services/sqflite/database_service.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Writing extends StatefulWidget {
  const Writing({super.key});

  @override
  _WritingState createState() => _WritingState();
}

class _WritingState extends State<Writing> {
  late DatabaseService _databaseProvider;

  // Initialize with default values
  double narrativeProgress = 0.0;
  double descriptiveProgress = 0.0;
  double informativeProgress = 0.0;
  double argumentativeProgress = 0.0;
  double discursiveProgress = 0.0;
  double creativeProgress = 0.0;

  double memosProgress = 0.0;
  double lettersProgress = 0.0;
  double articlesProgress = 0.0;
  double cvProgress = 0.0;
  double reportsProgress = 0.0;
  double speechesProgress = 0.0;

  bool isLoading = true; // Add a loading state

  @override
  void initState() {
    super.initState();
    _loadProgressValues();
  }

  Future<void> _loadProgressValues() async {
    _databaseProvider = Provider.of<DatabaseService>(context, listen: false);

    final narrative =
        await _databaseProvider.getSubsectionProgress('free', 'Narrative');
    final descriptive =
        await _databaseProvider.getSubsectionProgress('free', 'Descriptive');
    final informative =
        await _databaseProvider.getSubsectionProgress('free', 'Informative');
    final argumentative =
        await _databaseProvider.getSubsectionProgress('free', 'Argumentative');
    final discursive =
        await _databaseProvider.getSubsectionProgress('free', 'Discursive');
    final creative =
        await _databaseProvider.getSubsectionProgress('free', 'Creative');

    final memos =
        await _databaseProvider.getSubsectionProgress('guided', 'Memos');
    final letters =
        await _databaseProvider.getSubsectionProgress('guided', 'Letters');
    final articles =
        await _databaseProvider.getSubsectionProgress('guided', 'Articles');
    final cv = await _databaseProvider.getSubsectionProgress('guided', 'CV');
    final reports =
        await _databaseProvider.getSubsectionProgress('guided', 'Reports');
    final speeches =
        await _databaseProvider.getSubsectionProgress('guided', 'Speeches');

    setState(() {
      narrativeProgress = narrative;
      descriptiveProgress = descriptive;
      informativeProgress = informative;
      argumentativeProgress = argumentative;
      discursiveProgress = discursive;
      creativeProgress = creative;

      memosProgress = memos;
      lettersProgress = letters;
      articlesProgress = articles;
      cvProgress = cv;
      reportsProgress = reports;
      speechesProgress = speeches;

      isLoading = false; // Data is loaded
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          title: Text(
            'Writing and Compositions',
            style: TextStyle(
              fontFamily: 'Baloo 2',
              fontSize: 25.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator()) // Show loading indicator
            : Container(
                constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                  color: white,
                ),
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'The ZIMSEC Syllabus for English Language expects students to be able to write compositions on various topics in the different categories below:',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Baloo 2',
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 30.h),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Free Compositions',
                                style: TextStyle(
                                  fontFamily: 'Baloo 2',
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WritingCard(
                                  text: "Narrative",
                                  icon: "assets/images/reading.png",
                                  progress: narrativeProgress,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => PracticeTiles(
                                          title: 'Narrative',
                                          exercises:
                                              narrativeCompositionQuestions,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const Spacer(),
                                WritingCard(
                                  text: "Descriptive",
                                  icon: "assets/images/reading.png",
                                  progress: descriptiveProgress,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => PracticeTiles(
                                          title: 'Descriptive',
                                          exercises:
                                              descriptiveCompositionQuestions,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WritingCard(
                                  text: "Informative",
                                  icon: "assets/images/reading.png",
                                  progress: informativeProgress,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => PracticeTiles(
                                          title: 'Informative',
                                          exercises:
                                              informativeCompositionQuestions,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const Spacer(),
                                WritingCard(
                                  text: "Argumentative",
                                  icon: "assets/images/reading.png",
                                  progress: argumentativeProgress,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => PracticeTiles(
                                          title: 'Argumentative',
                                          exercises:
                                              argumentativeCompositionQuestions,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WritingCard(
                                  text: "Discursive",
                                  icon: "assets/images/reading.png",
                                  progress: discursiveProgress,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => PracticeTiles(
                                          title: 'Discursive',
                                          exercises:
                                              discursiveCompositionQuestions,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const Spacer(),
                                WritingCard(
                                  text: "Creative",
                                  icon: "assets/images/reading.png",
                                  progress: creativeProgress,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => PracticeTiles(
                                          title: 'Creative',
                                          exercises:
                                              creativeCompositionQuestions,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 70.h),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Guided Compositions',
                                style: TextStyle(
                                  fontFamily: 'Baloo 2',
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WritingCard(
                                  text: "Memos",
                                  icon: "assets/images/reading.png",
                                  progress: memosProgress,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => PracticeTiles(
                                          title: 'Memos',
                                          exercises: memosCompositionQuestions,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const Spacer(),
                                WritingCard(
                                  text: "Letters",
                                  icon: "assets/images/reading.png",
                                  progress: lettersProgress,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => PracticeTiles(
                                          title: 'Letters',
                                          exercises:
                                              lettersCompositionQuestions,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WritingCard(
                                  text: "Articles",
                                  icon: "assets/images/reading.png",
                                  progress: articlesProgress,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => PracticeTiles(
                                          title: 'Articles',
                                          exercises:
                                              articlesCompositionQuestions,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const Spacer(),
                                WritingCard(
                                  text: "CV",
                                  icon: "assets/images/reading.png",
                                  progress: cvProgress,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => PracticeTiles(
                                          title: 'CV',
                                          exercises: cvCompositionQuestions,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WritingCard(
                                  text: "Reports",
                                  icon: "assets/images/reading.png",
                                  progress: reportsProgress,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => PracticeTiles(
                                          title: 'Reports',
                                          exercises:
                                              reportsCompositionQuestions,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const Spacer(),
                                WritingCard(
                                  text: "Speeches",
                                  icon: "assets/images/reading.png",
                                  progress: speechesProgress,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => PracticeTiles(
                                          title: 'Speeches',
                                          exercises:
                                              speechesCompositionQuestions,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 70.h),
                          ]),
                    ),
                  ),
                ),
              ));
  }
}
