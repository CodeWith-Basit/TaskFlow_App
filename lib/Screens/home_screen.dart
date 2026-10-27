import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskflow/data/dummy_task.dart';
import 'package:taskflow/theme/app_colors.dart';
import 'package:taskflow/widgets/custom_app_bar.dart';
import 'package:taskflow/widgets/progress_card.dart';
import 'package:taskflow/widgets/section_header.dart';
import 'package:taskflow/widgets/task_card.dart';
import 'package:taskflow/widgets/task_summary_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 15, 16, 90),
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
                      height: 1.15,
                      fontSize: 25,
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
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.fire,
                          size: 15,
                          color: AppColors.primary,
                        ),
                        const SizedBox(height: 4),
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
              const ProgressCard(),
              const SizedBox(height: 20),
              const SectionHeader(title: "Your Task's"),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TaskSummaryCard(
                      icon: Icons.assignment_turned_in,
                      iconColor: AppColors.primary,
                      iconBgColor: AppColors.primary.withValues(alpha: 0.1),
                      count: "10",
                      title: "All Tasks",
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TaskSummaryCard(
                      icon: Icons.pending_actions,
                      iconColor: AppColors.error,
                      iconBgColor: AppColors.error.withValues(alpha: 0.1),
                      count: "4",
                      title: "Pending",
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TaskSummaryCard(
                      icon: Icons.check_circle_outline,
                      iconColor: AppColors.success,
                      iconBgColor: AppColors.success.withValues(alpha: 0.1),
                      count: "2",
                      title: "Completed",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const SectionHeader(title: "Today's Tasks"),
              const SizedBox(height: 12),
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
