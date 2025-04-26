// 📄 bloc_filter_custom_listview.dart
//
// Bloc Integration Example + Custom Horizontal Grid ListView with Selection Support

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // Entry point if you want to test
}

/*
------------------------------------------------------------
🔷 BlocBuilder with CustomSingleHorizontalListView
------------------------------------------------------------

- Using BlocBuilder to manage state dynamically.
- Selected item highlighting in a custom grid view.

Example:

BlocBuilder<FilterBloc, FilterState>(
  builder: (context, state) {
    return CustomSingleHorizontalListView<StoneShape>(
      title: "Select Shape",
      items: stoneShapeData, // Example list
      selectedItem: state.selectedShape,
      onSelected: (shape) {
        context.read<FilterBloc>().add(SelectShape(shape.stoneName!));
      },
    );
  },
);

✅ The 'selectedItem' is directly tied to Bloc state.

------------------------------------------------------------
🛠️ Custom Widget: CustomSingleHorizontalListView
------------------------------------------------------------

Generic customizable grid-based horizontal list view.

class CustomSingleHorizontalListView<T> extends StatelessWidget {
  final String title;
  final List<T> items;
  final T? selectedItem;
  final void Function(T) onSelected;
  final int crossAxisCount; // Number of items per row

  const CustomSingleHorizontalListView({
    Key? key,
    required this.title,
    required this.items,
    required this.selectedItem,
    required this.onSelected,
    this.crossAxisCount = 5, // Default value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitleTextWidget(title: title),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 2,
            crossAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            final isSelected = item == selectedItem;
            return GestureDetector(
              onTap: () => onSelected(item),
              child: Container(
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  color: isSelected
                      ? AppColor.appBarColor
                      : AppColor.drawerBgColor,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFCFD4DC)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x0C101828),
                      blurRadius: 2,
                      offset: Offset(0, 1),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Text(
                  item.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: isSelected
                        ? AppColor.kWhiteColor
                        : AppColor.kGrayText,
                    fontSize: 14,
                    fontFamily: "SFProDisplay",
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

------------------------------------------------------------
*/

