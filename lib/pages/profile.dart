import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:daily_coding/i18n/my_localizations.dart';
import 'package:daily_coding/theme/images.dart';
import 'package:daily_coding/utils/utils.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 800,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildHeader(context),
                Container(
                  margin: const EdgeInsets.all(16.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(color: Colors.grey.shade200),
                  child: Text(
                      "Over 3+ years of web/APP development and 8+ years of experience in IC firmware development "),
                ),
                _buildTitle("Skills"),
                SizedBox(height: 5.0),
                _buildSkillRow("Flutter", 0.7),
                SizedBox(height: 10.0),
                _buildSkillRow("C/Firmware", 0.85),
                SizedBox(height: 5.0),
                _buildSkillRow("React", 0.75),
                SizedBox(height: 5.0),
                _buildSkillRow("NodeJS", 0.65),
                SizedBox(height: 30.0),
                _buildTitle("Experience"),
                _buildExperienceRow(
                    company: "Juneyao Airlines",
                    position: "Senior Frontend Developer",
                    duration: "2019 - current"),
                _buildExperienceRow(
                    company: "HNA",
                    position: "Frontend tech-lead",
                    duration: "2016 - 2018"),
                _buildExperienceRow(
                    company: "Intel",
                    position: "Senior Firmware engineer",
                    duration: "2010 - 2016"),
                _buildExperienceRow(
                    company: "Huawei",
                    position: "Software engineer",
                    duration: "2008 - 2010"),
                SizedBox(height: 20.0),
                _buildTitle("Education"),
                SizedBox(height: 5.0),
                _buildExperienceRow(
                    company: "Xidian University, Xi'an China",
                    position:
                        "M.S. Telecommunication and Information Technology",
                    duration: "2005 - 2008"),
                _buildExperienceRow(
                    company: "Xidian University, Xi'an China",
                    position: "B.S. Telecommunication",
                    duration: "2001 - 2005"),
                SizedBox(height: 20.0),
                _buildTitle("Contact"),
                SizedBox(height: 5.0),
                Row(
                  children: <Widget>[
                    SizedBox(width: 30.0),
                    Icon(
                      Icons.video_collection_rounded,
                      color: Colors.black54,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      "微信号:liveoverflow",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    SizedBox(width: 30.0),
                    Icon(
                      Icons.phone,
                      color: Colors.black54,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      "+86-9818523107",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                _buildSocialsRow(),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Row _buildSocialsRow() {
  return Row(
    children: <Widget>[
      SizedBox(width: 20.0),
      IconButton(
        color: Colors.indigo,
        icon: Icon(FontAwesomeIcons.linkedin),
        onPressed: () {
          launchURL("https://www.linkedin.com/in/meilab/");
        },
      ),
      SizedBox(width: 5.0),
      IconButton(
        color: Colors.indigo,
        icon: Icon(FontAwesomeIcons.github),
        onPressed: () {
          launchURL("https://github.com/meilab");
        },
      ),
      SizedBox(width: 5.0),
      IconButton(
        color: Colors.red,
        icon: Icon(FontAwesomeIcons.video),
        onPressed: () {
          launchURL("https://space.bilibili.com/494537125");
        },
      ),
      SizedBox(width: 10.0),
    ],
  );
}

ListTile _buildExperienceRow(
    {required String company,
    required String position,
    required String duration}) {
  return ListTile(
    leading: Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 20.0),
      child: Icon(
        FontAwesomeIcons.solidCircle,
        size: 12.0,
        color: Colors.black54,
      ),
    ),
    title: Text(
      company,
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
    subtitle: Text("$position ($duration)"),
  );
}

Row _buildSkillRow(String skill, double level) {
  return Row(
    children: <Widget>[
      SizedBox(width: 16.0),
      Expanded(
          flex: 2,
          child: Text(
            skill.toUpperCase(),
            textAlign: TextAlign.right,
          )),
      SizedBox(width: 10.0),
      Expanded(
        flex: 5,
        child: LinearProgressIndicator(
          value: level,
        ),
      ),
      SizedBox(width: 16.0),
    ],
  );
}

Widget _buildTitle(String title) {
  return Padding(
    padding: const EdgeInsets.only(left: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title.toUpperCase(),
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        Divider(
          color: Colors.black54,
        ),
      ],
    ),
  );
}

Row _buildHeader(BuildContext context) {
  return Row(
    children: <Widget>[
      SizedBox(width: 20.0),
      Container(
          width: 80.0,
          height: 80.0,
          child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey,
              child: CircleAvatar(
                  radius: 35.0,
                  backgroundImage: AssetImage(MyImages.PROFILE_IMAGE)))),
      SizedBox(width: 20.0),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            MyLocalizations.of(context)!.author(),
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Text("Full Stack Engineer:"),
          Text("Frontend/Backend/Embedded"),
          SizedBox(height: 5.0),
          Row(
            children: <Widget>[
              Icon(
                FontAwesomeIcons.map,
                size: 12.0,
                color: Colors.black54,
              ),
              SizedBox(width: 10.0),
              Text(
                "Xi'an, China",
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ],
      )
    ],
  );
}
