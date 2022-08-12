import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tmdb/common/constants.dart';

class LoadTiles extends StatelessWidget {
  const LoadTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return SizedBox(
      child: Shimmer.fromColors(
        baseColor: Constants.colorGreyShimmer!,
        highlightColor: Constants.colorGreyHighlight!,
        child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
                5,
                (index) => 
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                       height:  300,
                      width:  300,
                      color: Colors.red,
                    ),
                  ),
                )
                 )
                  ),
      ),
    );
  }
}

class LoadContainer extends StatelessWidget{
  final bool small;
  const LoadContainer({Key? key, this.small = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Shimmer.fromColors(
        baseColor: Constants.colorGreyShimmer!,
        highlightColor: Constants.colorGreyHighlight!,
     child: Container(
                       height: small == false ? 300 : 200,
                      width: small == true ? 300 : 150,
                        color: Colors.red,
                      ),
   );
  } 

}