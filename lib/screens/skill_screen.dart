import 'package:flutter/material.dart';
import '../helpers/responsive.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFC4ACA1),
              blurRadius: 6,
              spreadRadius: 4,
            )
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: SizedBox(
          height: !AppUI.isMobile(context) ? AppUI.dw(context) / 6.8 : 77,
          width: !AppUI.isMobile(context) ? AppUI.dw(context) / 6.8 : 77,
          child: Padding(
            padding: AppUI.isMobile(context)
                ? const EdgeInsets.all(8.0)
                : const EdgeInsets.all(30.0),
            child: Image.network(url),
          ),
        ),
      ),
    );
  }
}

///

class TopSkills extends StatelessWidget {
  const TopSkills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text(
            'My Top Skills',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppUI.isMobile(context) ? 10 : AppUI.dw(context) / 4,
            ),
            child: Wrap(
              children: const [
                SkillCard(
                  url:
                      'https://upload.wikimedia.org/wikipedia/commons/1/18/C_Programming_Language.svg',
                ),
                SkillCard(
                  url:
                      'https://upload.wikimedia.org/wikipedia/commons/1/18/ISO_C%2B%2B_Logo.svg',
                ),
                SkillCard(
                  url: 'https://cdn-icons-png.flaticon.com/512/226/226777.png',
                ),
                SkillCard(
                  url:
                      'https://raw.githubusercontent.com/voodootikigod/logo.js/master/js.png',
                ),
                SkillCard(
                  url:
                      'https://user-images.githubusercontent.com/26507463/53453892-49908900-3a04-11e9-9dce-77ed3d694326.png',
                ),
                SkillCard(
                  url:
                      'https://cdn.iconscout.com/icon/free/png-256/flutter-2038877-1720090.png',
                ),
                SkillCard(
                  url:
                      'https://cdn4.iconfinder.com/data/icons/google-i-o-2016/512/google_firebase-2-512.png',
                ),
                SkillCard(
                  url:
                      'https://www.mysql.com/common/logos/logo-mysql-170x115.png',
                ),
                SkillCard(
                  url:
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Git_icon.svg/1024px-Git_icon.svg.png',
                ),
                SkillCard(
                  url:
                      'https://upload.wikimedia.org/wikipedia/commons/6/61/HTML5_logo_and_wordmark.svg',
                ),
                SkillCard(
                  url:
                      'https://upload.wikimedia.org/wikipedia/commons/d/d5/CSS3_logo_and_wordmark.svg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
