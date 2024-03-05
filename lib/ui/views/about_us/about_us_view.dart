import 'package:darrebni_exam/ui/shared/shared_widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        TitleWiget(svg: "ic_arrow", text: "عن التطبيق"),
        Container(
          child: SvgPicture.asset('assets/images/svgs/aboutus.svg'),
        )
      ]),
    );
  }
}
