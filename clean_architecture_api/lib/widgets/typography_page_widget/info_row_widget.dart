import 'package:flutter/material.dart';
import 'package:clean_architecture_api/resources/app_colors.dart';

class InfoRowWidget extends StatelessWidget {
  final Widget icon;
  final String label;
  final String value;
  final Color color;

  const InfoRowWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6 - 32,
          child: Row(
            children: [
              IconTheme(data: IconThemeData(color: color, size: 22), child: icon),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4 - 32,
          child: Text(
            value,
            style: TextStyle(color: AppColors.color6C6C6C, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
