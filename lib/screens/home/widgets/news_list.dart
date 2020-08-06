import 'package:flutter/material.dart';

import '../../../widgets/poke_news.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 9,
      separatorBuilder: (context, index) => Divider(),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return PokeNews(
          title: "Read about Covid-19 pandemic impact...",
          time: "15 May 2020",
          thumbnail: Image.asset("assets/images/thumbnail.png"),
        );
      },
    );
  }
}
