import 'package:flutter/material.dart';
import 'package:travel_app/animation/fade_animation.dart';
import 'package:travel_app/model/travel.dart';

class DetailView extends StatefulWidget {
  final int id;
  const DetailView({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Travel> _travelList = Travel.getTravelItems();

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: size.height,
              width: double.infinity,
              child: FittedBox(
                child: Image.asset(_travelList[widget.id].imageUrl[0]),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black87.withOpacity(.3),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: GestureDetector(
              onTap: () => print("more menu"),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black87.withOpacity(.3),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: const Center(
                  child: Icon(
                    Icons.more_vert_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: size.height * .6,
              width: size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.topCenter,
                      stops: const [0, 1],
                      colors: [Colors.white, Colors.white.withOpacity(.03)])),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            width: size.width * .8,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeAnimation(
                    delay: .1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _travelList[widget.id].name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/star.png",
                              width: 30,
                            ),
                            Text(
                              _travelList[widget.id].rating.toString(),
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                    delay: .2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.account_balance_wallet,
                              color: Color(0xff8f297f),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            RichText(
                              text: TextSpan(
                                  text: r'$',
                                  style: TextStyle(
                                    color: Colors.black87.withOpacity(.5),
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text:
                                          _travelList[widget.id].cost.toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/pin.png',
                              width: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            RichText(
                              text: TextSpan(
                                  text: _travelList[widget.id].location,
                                  style: TextStyle(
                                    color: Colors.black87.withOpacity(.5),
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '(' +
                                          _travelList[widget.id]
                                              .distance
                                              .toString() +
                                          'km)',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                    delay: .3,
                    child: Text(_travelList[widget.id].description, style: const TextStyle(
                      color: Color(0xff686771),
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                    delay: .4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Icon(Icons.favorite_border, color: Color(0xff8f294f),),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              color: Color(0xff8f294f),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(9),
                            child: const Center(
                              child: Text('Discover', style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),),
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xff8f294f),
                              border: Border.all(
                                color: Color(0xff8f294f),
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
