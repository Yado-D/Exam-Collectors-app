
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../auth/examFetching.dart';
import '../../../utils/AppColorCollections.dart';
import '../../../widgets/AllCommonWidget.dart';

void _launchSocialMedia(String url) async {
  final Uri _url = Uri.parse(url);
  if (await canLaunchUrl(_url)) {
    await launchUrl(_url);
  } else {
    throw 'Could not launch $_url';
  }
}

Widget opportunityPage() {
  return FutureBuilder<List<Map<String, dynamic>>>(
    future: fetchingExams().fetchOpportunity(), // Fetching data
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        // Return a SliverToBoxAdapter with a loading spinner
        return const SliverToBoxAdapter(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }

      if (snapshot.hasError) {
        // Return a SliverToBoxAdapter with an error message
        return SliverToBoxAdapter(
          child: Center(
            child: Text(
              'Failed to load opportunities: ${snapshot.error}',
              style: const TextStyle(color: Colors.red),
            ),
          ),
        );
      }

      if (!snapshot.hasData || snapshot.data!.isEmpty) {
        // Return a SliverToBoxAdapter with an empty message
        return const SliverToBoxAdapter(
          child: Center(
            child: Text(
              'No opportunities available.',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        );
      }

      final opportunities = snapshot.data!;

      // Return a SliverGrid for the fetched opportunities
      return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 10 / 15,
          ),
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              final opportunity = opportunities[index];
              final url = opportunities[index]["link"];// Corrected URL
              return GestureDetector(
                onTap: ()=>_launchSocialMedia(url),
                child: Stack(
                  children: [
                    Container(
                      height: 250,
                      width: 200,
                      margin:
                      const EdgeInsets.only(right: 10, bottom: 5, top: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                        image:  DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(opportunities[index]["image"]),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20, left: 4),
                      color: ColorCollections.GreyColor,
                      child: ReusableText(
                        // FromTop: 20,
                        TextString: opportunity['txt'] ?? 'Untitled',
                        FontSize: 16,
                        TextColor: ColorCollections.WhiteColor,
                        TextFontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              );
            },
            childCount: opportunities.length,
          ),
        ),
      );
    },
  );
}

