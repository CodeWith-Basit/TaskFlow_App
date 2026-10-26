import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskflow/data/dummy_task.dart';
import 'package:taskflow/theme/app_colors.dart';
import 'package:taskflow/widgets/progress_card.dart';
import 'package:taskflow/widgets/task_card.dart';
import 'package:taskflow/widgets/task_summary_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              height: 35,
              width: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: FaIcon(
                FontAwesomeIcons.check,
                size: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 8),
            Text(
              "TaskFlow",
              style: GoogleFonts.inter(
                fontSize: 25,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CircleAvatar(
              radius: 24,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSORJgezgSVfKPU9hI13wkD0Sfci6HzUbCAagmVyBvbudVidHqWurj2scrO&s=10",
                  height: 45,
                  width: 45,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good Morning 👋",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Let’s get things\ndone",
                    style: GoogleFonts.inter(
                      height: 1,
                      fontSize: 27,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        FaIcon(
                          FontAwesomeIcons.fire,
                          size: 15,
                          color: AppColors.primary,
                        ),
                        Text(
                          "5 Days",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                "Tuesday, 29 May",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 20),
              ProgressCard(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Tasks",
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    "See All",
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TaskSummaryCard(
                    icon: Icons.assignment_turned_in,
                    iconColor: AppColors.primary,
                    iconBgColor: AppColors.primary.withValues(alpha: 0.1),
                    count: "12",
                    title: "All Tasks",
                  ),
                  TaskSummaryCard(
                    icon: Icons.pending_actions,
                    iconColor: AppColors.error,
                    iconBgColor: AppColors.error.withValues(alpha: 0.1),
                    count: "5",
                    title: "Pending",
                  ),
                  TaskSummaryCard(
                    icon: Icons.check_circle_outline,
                    iconColor: AppColors.success,
                    iconBgColor: AppColors.success.withValues(alpha: 0.1),
                    count: "3",
                    title: "Completed",
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today's Tasks",
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    "See All",
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dummyTasks.length > 5 ? 5 : dummyTasks.length,
                itemBuilder: (context, index) {
                  final task = dummyTasks[index];
                  return TaskCard(task: task);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
