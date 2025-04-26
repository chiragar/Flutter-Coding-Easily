///////////////////////////////////////////////////////////////////////////////////////////////////////////
//  "options": {
//                     "A": "All men to be saved and to come to the knowledge of the world",
//                     "B": "Some men to be saved and to come to the knowledge of the truth",
//                     "C": "All men to be saved and to come to the knowledge of the truth",
//                     "D": "Some men to be saved and to come to the knowledge of the world",
//                     "E": "",
//                     "F": "",
//                     "G": ""
// }
///////////////////////////////////////////////////////////////////////////////////////////////////////////
// import 'package:flutter/material.dart';

// class QuizOptions extends StatelessWidget {
//   final Map<String, dynamic> options;

//   QuizOptions({required this.options});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: options.entries.map((entry) {
//         final optionKey = entry.key;
//         final optionValue = entry.value;
//         return RadioListTile<String>(
//           title: Text(optionValue.toString()),
//           value: optionKey,
//           groupValue: null, // Add the selected value here to make the radio buttons interactive.
//           onChanged: null, // Add a function here to handle the user's selection.
//         );
//       }).toList(),
//     );
//   }
// }

///////////////////////////////////////////////////////////////////////////////////////////////////////////
//  "options": [
    // { "A": "All men to be saved and to come to the knowledge of the world"},
//                    { "B": "Some men to be saved and to come to the knowledge of the truth"},
//                    { "C": "All men to be saved and to come to the knowledge of the truth"},
//                   {  "D": "Some men to be saved and to come to the knowledge of the world"},
//                    { "E": ""},
//                    { "F": ""},
//                   {  "G": ""}
// 
// ]

///////////////////////////////////////////////////////////////////////////////////////////////////////////
//  for (var option in question.options)
// if (option.values.first.isNotEmpty)
// Obx(() => Padding(
//       padding: EdgeInsets.all(
//           size.width * 0.02),
//       child: SizedBox(
//           width: Get.width,
//           child: OutlinedButton(
//               onPressed: () =>
//                   controller.selectAnswer(
//                       option.keys
//                           .first),
//               style: identical(
//                       option.keys
//                           .first,
//                       controller
//                           .selectedAnswer
//                           .value)
//                   ? CustomStyles
//                       .selectedButtonStyle
//                   : CustomStyles
//                       .optionButtonStyle,
//               child: Text(
//                   option.values.first,
//                   style: Theme.of(context).textTheme.titleSmall,
//                   textAlign: TextAlign.start))),
//     )),
