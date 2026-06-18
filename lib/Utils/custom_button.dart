// import 'package:flutter/material.dart';
// import 'package:sohrab_portfolio/Utils/appcolors.dart';

// class CustomButton extends StatelessWidget {
//   final double? height;
//   final double? width;
//   final Color? color;
//   final String text;
//   final TextStyle? textStyle;
//   final IconData? icon;
//   final Color iconColor;
//   final double? borderRadius;
//   final VoidCallback onTap;
//   final double spacing;

//    CustomButton({
//     super.key,
//      this.height,
//      this.width,
//      this.color,
//     required this.text,
//     required this.onTap,
//     this.textStyle,
//     this.icon,
//     this.iconColor = Colors.white,
//     this.borderRadius = 12,
//     this.spacing = 10,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius:  BorderRadius.circular(15),
//       child: Container(
//         height: height ?? 60,
//         width: width,
//         decoration: BoxDecoration(
//           color: color ?? AppColors.primary,
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               text,
//               style: textStyle ??
//                   const TextStyle(
//                     color: Colors.white,
//                     fontSize: 26,
//                     fontWeight: FontWeight.w500,
//                   ),
//             ),
//             if (icon != null) SizedBox(width: spacing),
//             if (icon != null)
//               Icon(
//                 icon,
//                 color: iconColor,
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }