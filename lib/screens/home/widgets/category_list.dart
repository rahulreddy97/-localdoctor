import 'package:flutter/cupertino.dart';
import 'package:Doctorapp/widgets/poke_hospital_card.dart';

import '../../../data/categories.dart';
import '../../../data/hospitals.dart';
import '../../../widgets/poke_category_card.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({@required this.count, @required this.isHospitals});

  final int count;
  final bool isHospitals;
  @override
  Widget build(BuildContext context) {
    final String hospitals = 'Hospitals';
    final String categoies = 'Categories';
    var cat;
    if (isHospitals) {
      cat = hospital;
    } else {
      cat = categories;
    }
    return GridView.builder(
      physics: BouncingScrollPhysics(), //NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: count,
        childAspectRatio: 2.44,
        crossAxisSpacing: 10,
        mainAxisSpacing: 12,
      ),
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(
        left: 28,
        right: 28,
        bottom: 58,
      ),
      itemCount: cat.length,
      

      itemBuilder: (context, index) => isHospitals
          ? PokeHospitalCard(cat[index],
              onPress: () => Navigator.of(context).pushNamed(
                    "/pokedex",
                    arguments: hospitals,
                  ))
          : PokeCategoryCard(
              cat[index],
              onPress: () => Navigator.of(context).pushNamed(
                "/pokedex",
                arguments: categoies,
              ),
            ),
    );
  }
}
