import 'package:flutter/material.dart';
import 'package:igapp/Theme/ThemeModal.dart';
import 'package:provider/provider.dart';
// import 'package:google_fonts/google_fonts.dart';


class IDS extends StatelessWidget {
  const IDS({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModal themeNotifier, child) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 35,
                ),
                Center(
                  child: Image.asset(
                    'images/ids333-removebg-preview.png',
                    height: 75,
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                const Text(
                  'Introduction to App Developers Society:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Nestled within the prestigious VNIT Nagpur, the Institute Development Society (IDS) stands as a beacon for tech enthusiasts and skilled developers, fostering a culture of innovation and creativity. Within this dynamic environment, the App Developers Society emerges as a specialized community dedicated to pushing the boundaries of mobile application development. This vibrant society provides a haven for developers to converge, collaborate, and transform ideas into functional, user-friendly experiences, embodying the spirit of excellence that defines VNIT Nagpur.',
                  // style:
                  //     GoogleFonts.lato(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'A Platform for Learning and Growth:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                    'At the heart of VNIT Nagpur, the App Developers Society is committed to providing an unparalleled environment for learning and growth. Through an array of workshops, seminars, and hands-on projects, members are empowered to explore various facets of app development, including UI/UX design, coding languages, and the integration of cutting-edge technologies. The society not only equips its members with technical proficiency but also instills a passion for innovation, encouraging them to think beyond conventional boundaries and bring their creative visions to life.'),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Collaboration and Networking Opportunities:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                    'In the spirit of collaboration, the App Developers Society at VNIT Nagpur provides a platform for members to connect and work on real-world projects. Irrespective of whether you are a seasoned developer looking to share your expertise or a newcomer seeking guidance, our society offers a welcoming space where mentorship and collaboration flourish. Regular meetups, hackathons, and collaborative coding sessions create an atmosphere that promotes knowledge sharing and teamwork, fostering an ecosystem where developers can grow both professionally and personally.'),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Showcasing Talent and Achievements:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Text(
                    'Within the halls of VNIT Nagpur, the App Developers Society believes in recognizing and celebrating the accomplishments of its members. The society provides opportunities for members to showcase their apps, present innovative solutions, and participate in app competitions. Through these avenues, we aim to highlight the diverse talents within our community and inspire others to reach new heights in their app development journey. Whether creating impactful social apps or revolutionizing industry-specific solutions, the App Developers Society at VNIT Nagpur is the conduit to turn ideas into reality and make a lasting impact on the world of mobile applications.'),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}