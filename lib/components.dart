import 'package:coffee_ui/coffee_model.dart';
import 'package:coffee_ui/pages/card_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

Color btnClr = const Color(0xFFD27842);
final UrlImage = [
  'assets/images/list_optimized.png',
  'assets/images/listview2_optimized.png',
  'assets/images/listview3_optimized.png'
];

NavAndFinish(context, Widget) => Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => Widget), (route) {
      return false;
    });

NavTo(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));

Widget AppButton({String? text, required Function onPressed}) => Container(
      width: 250.0,
      height: 80.0,
      decoration: BoxDecoration(
          color: btnClr,
          border: Border.all(color: btnClr),
          borderRadius: BorderRadius.circular(40.0)),
      child: MaterialButton(
        onPressed: onPressed(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Text(
          text!.toUpperCase(),
          style: GoogleFonts.roboto(color: Colors.white, fontSize: 35.0),
        ),
      ),
    );

Widget CardButton({String? text, required Function onPressed}) => Container(
      width: 200.0,
      height: 70.0,
      decoration: BoxDecoration(
          color: btnClr,
          border: Border.all(color: btnClr),
          borderRadius: BorderRadius.circular(20.0)),
      child: MaterialButton(
        onPressed: onPressed(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          text!,
          style: GoogleFonts.roboto(
              color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),
        ),
      ),
    );

Widget BuildCarousel(String Images, int index) => AspectRatio(
      aspectRatio: 4 / 3,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        child: Image.asset(Images, fit: BoxFit.cover),
      ),
    );

Widget BuildCard(CoffeeModel? model, context) => Padding(
      padding: const EdgeInsets.only(bottom: 30.0, left: 30.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        onTap: () => NavTo(
            context,
            CardPage(
              model: model,
            )),
        child: Container(
          padding: EdgeInsets.all(10.0),
          width: 150.0,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: Image.asset(
                    '${model!.assetImage!}',
                    height: 130.0,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Text(
                model.name!,
                style: GoogleFonts.nunito(fontSize: 20.0),
              ),
              Expanded(
                  child: Text(model.subname!,
                      style: GoogleFonts.nunito(
                          fontSize: 15.0, fontWeight: FontWeight.w400))),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Row(
                            children: [
                              Text(
                                '\$',
                                style: GoogleFonts.rubik(
                                    fontSize: 18.0, color: btnClr),
                              ),
                              Text(
                                "${model.price!}",
                                style: GoogleFonts.rubik(fontSize: 18.0),
                              ),
                            ],
                          )),
                          Expanded(
                              child: Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                                color: btnClr,
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 7.0,
                                ),
                                Icon(FontAwesomeIcons.solidStar, size: 12.0),
                                SizedBox(
                                  width: 6.0,
                                ),
                                Text(
                                  "${model.rating!}",
                                  style: GoogleFonts.rubik(fontSize: 15.0),
                                ),
                                SizedBox(
                                  width: 7.0,
                                ),
                              ],
                            ),
                          )),
                        ],
                      ),
                      FloatingActionButton.small(
                          backgroundColor: btnClr,
                          heroTag: null,
                          onPressed: () {},
                          child: Icon(Icons.add))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

class CircleTabIndustor extends Decoration {
  Color? color;
  double? radius;

  CircleTabIndustor({this.color, this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return ClassPainter(color, radius);
  }
}

class ClassPainter extends BoxPainter {
  Color? color;
  double? radius;

  ClassPainter(this.color, this.radius);

  @override
  void paint(
      Canvas canvas, Offset offset, ImageConfiguration imageConfiguration) {
    Paint? paint;
    paint = Paint()..color = color!;
    paint = paint..isAntiAlias = true;
    Offset? circleOffset = offset! +
        Offset(imageConfiguration.size!.width / 2,
            imageConfiguration.size!.height - radius!);
    canvas.drawCircle(circleOffset, radius!, paint);
  }
}

Widget CardTitle({String? title, required double left, double? size}) =>
    Padding(
      padding: EdgeInsets.only(left: left, top: 5.0),
      child: Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(
            title!,
            style: GoogleFonts.roboto(fontSize: size),
          )),
    );
