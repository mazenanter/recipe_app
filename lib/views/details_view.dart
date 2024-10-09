import 'package:flutter/material.dart';
import 'package:recipe_app/utils/app_text_styles.dart';
import 'package:recipe_app/widgets/ingredirents_details_list_view.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            const Text(
              'How to make french toast',
              style: AppTextStyles.syleSemiBold24,
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const Image(
                  image: AssetImage(
                    'assets/image 13.png',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Ingredients',
              style: AppTextStyles.syleSemiBold20,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    const IngredientsDetailsListView(),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
