class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? androidLink;
  final String? iosLink;
  final String? weblink;
  ProjectUtils(
      {required this.image,
      required this.title,
      required this.subtitle,
      this.androidLink,
      this.iosLink,
      this.weblink});
}

//hobby projects
List<ProjectUtils> hobbyProjectUtils = [
  ProjectUtils(
    image: "assets/images/meals.png",
    title: "Meals App",
    subtitle:
        "Developed a meals app offering a variety of recipes from different countries..",
    androidLink: "https://github.com/Mohsinkhani/Meals-App",
    iosLink: "https://github.com/Mohsinkhani/Meals-App",
  ),
  ProjectUtils(
    image: "assets/images/tourism.png",
    title: "Tourism App",
    subtitle:
        "Developed a tourism app with hotel booking, transport management, and curated recommendations of beautiful places based on organizational offers.",
    androidLink: "https://github.com/Mohsinkhani/Tourism-App",
    iosLink: "https://github.com/Mohsinkhani/Tourism-App",
  ),
  ProjectUtils(
    image: "assets/images/funding.png",
    title: "Funding app",
    subtitle:
        "Developed a funding app for a welfare foundation to help and collect donations for needy people.",
    androidLink:
        "https://github.com/Mohsinkhani/life-line/tree/master/poc_life_line_foundation",
    iosLink:
        "https://github.com/Mohsinkhani/life-line/tree/master/poc_life_line_foundation",
  ),
];

//################
//wok projects
List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
    image: "assets/images/smartcv.png",
    title: "Resume Builder App",
    subtitle:
        "Contributed to the Smart CV application on Google Play by developing UI elements and templates for CVs, cover letters, and resignation letters.",
    androidLink:
        "https://play.google.com/store/apps/details?id=com.resumebuilder.cvmaker.cvtemplate.resumetemplate",
    iosLink:
        "https://play.google.com/store/apps/details?id=com.resumebuilder.cvmaker.cvtemplate.resumetemplate",
  ),
  ProjectUtils(
    image: "assets/project/ringtone.png",
    title: "Ringtone App",
    subtitle:
        "A Ringtone app that allows users to assign specific ringtones to contacts, SIM notifications, and alarms.",
    androidLink: "https://github.com/Mohsinkhani/Ringtone_App",
    iosLink: "https://github.com/Mohsinkhani/Ringtone_App",
  ),
  ProjectUtils(
    image: "assets/images/solidwastelogo.png",
    title: "solid waste",
    subtitle:
        "Solid-waste offers live, real-time surveillance of drainage systems, ensuring instant alerts and proactive maintenance for optimal functionality. ",
    androidLink: "https://github.com/Mohsinkhani/Flutter_SolidwasteApp",
    iosLink: "https://github.com/Mohsinkhani/Flutter_SolidwasteApp",
  ),
  ProjectUtils(
    image: "assets/project/gym.png",
    title: "GYM App",
    subtitle:
        " Designed a GYM app UI with a BMI calculator, appointment scheduling, trainer ratings, and a demo video player.",
    androidLink: "https://github.com/Mohsinkhani/Gym-App",
    iosLink: "https://github.com/Mohsinkhani/Gym-App",
  ),
  ProjectUtils(
    image: "assets/images/flutter.png",
    title: "Crud App",
    subtitle:
        "Designed a CRUD app using Flutter and Dart with an ASP.NET Core Web API backend, Docker for deployment, and MongoDB for data management.",
    androidLink:
        "https://github.com/Mohsinkhani/Flutter-CrudApp/tree/main/testcrud",
    iosLink:
        "https://github.com/Mohsinkhani/Flutter-CrudApp/tree/main/testcruds",
  ),
  ProjectUtils(
    image: "assets/images/socialmedia.png",
    title: "Social Media App",
    subtitle:
        "Created a social media app with Flutter, Dart, and Firebase featuring image uploads, friend connections, real-time chat, and Instagram-like activities for an immersive experience",
    androidLink: "https://github.com/Mohsinkhani/Flutter_Social_mediaApp",
    iosLink: "https://github.com/Mohsinkhani/Flutter_Social_mediaApp",
  ),
];
