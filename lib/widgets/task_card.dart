import 'package:flutter/material.dart';
import 'package:taskflow/model/task_model.dart';
import 'package:taskflow/theme/app_colors.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              task.taskName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: task.priority == 'High'
                  ? AppColors.error.withValues(alpha: 0.4)
                  : task.priority == 'Medium'
                  ? AppColors.warning.withValues(alpha: 0.4)
                  : AppColors.success.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '${task.priority}',
              style: TextStyle(
                fontSize: 14,
                color: task.priority == "High"
                    ? Color(0xff93000a)
                    : task.priority == "Medium"
                    ? Color(0xff7a4f00)
                    : Color(0xff005c00),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Checkbox(
            value: task.isComplete,
            activeColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            onChanged: (bool? value) {},
          ),
        ],
      ),
    );
  }
}
