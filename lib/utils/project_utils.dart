class ProjectUtils {
  final String image; // Main project image
  final String title;
  final String subtitle;
  final String? androidLink;
  final String? iosLink;
  final String? weblink;
  final List<String>? screenshots; // List of 3-5 screenshot URLs
  final List<String> techStack; // Technologies used

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.androidLink,
    this.iosLink,
    this.weblink,
    this.screenshots,
    required this.techStack,
  });
}

// Hobby projects with multiple screenshots
List<ProjectUtils> hobbyProjectUtils = [
  ProjectUtils(
    image: "assets/project/spslogo.jpeg",
    title: "Saudi Project Support",
    subtitle: "Developed a website for SaudiPS to showcase services like transport, accommodation, catering, and IT, supporting projects with tailored business solutions in Saudi Arabia.",
    weblink: "https://saudips.org/",
    screenshots: [],
    
    techStack: ["WordPess", "Php", ],
  ),
 
  ProjectUtils(
    image: "assets/project/lerelax.jpeg",
    title: "Hotel Management App",
    subtitle: "Developed a hotel management website with room booking, admin dashboard for reservation approval, invoice generation, monthly reports, room availability tracking, and guest list management.",
   weblink: "https://lerelax.online/",
 screenshots: [],
    techStack: ["React", "TypeScript", "Supabase",],
  ),
   ProjectUtils(
    image: "assets/project/CoffeeShopLogo.png",
    title: "Coffee shop Website",
    subtitle: "Developed a coffee shop website with online ordering, coffee status tracking, estimated preparation time, and an admin dashboard for order management and monthly sales reports.",
    weblink: "https://coffeshopweb.netlify.app/",
    screenshots: [],
    techStack: ["React", "TypeScript", "Supabase",],
  ),
  ProjectUtils(
    image: "assets/project/e_commerce/ecommercelogo.png",
    title: "ShopHub",
    subtitle: "Developed an e-commerce website featuring 100+ brands, with advanced filters, search functionality, pagination, and a smooth shopping experience.",
    weblink: "https://mshophub.netlify.app/",
    screenshots: [],
    techStack: ["React", "TypeScript", "Supabase",],
  ),
     ProjectUtils(
    image: "assets/images/AyPortfolio.png",
    title: "Portfolio",
    subtitle: "Developed a personal portfolio website for the company’s CEO, showcasing their journey, achievements, and all company projects in one place.",
    weblink: "https://mohammedayub.netlify.app/",
    screenshots: [],
    techStack: ["React", "TypeScript", "Supabase",],
  ),
   ProjectUtils(
    image: "assets/images/mkLogo1.png",
    title: "Bussines Portfolio",
    subtitle: "Developed a business portfolio website to showcase web and app projects, designed for client engagement and digital marketing purposes.",
    weblink: "https://mkportfoli.netlify.app/",
    screenshots: [],
    techStack: ["React", "TypeScript", "Supabase",],
  ),
  ProjectUtils(
    image: "assets/project/finance.png",
    title: "Finance Management",
    subtitle: "Developed a finance management website with features for handling assets, billing, transactions, and overall financial tracking",
    weblink: "https://financewebmangement.netlify.app/",
    screenshots: [],
    techStack: ["React", "TypeScript", "Supabase",],
  ),
];

// Work projects with multiple screenshots
List<ProjectUtils> workProjectUtils = [
  
     ProjectUtils(
    image: "assets/project/hijriApp/icon.png",
    title: "Hijria",
    subtitle: "This all-in-one, feature-rich Islamic application will give you a smooth experience to connect with your Islamic practices and enhance your spirituality.\n\nHijria will provide you the ease to find qibla direction, convert and find date in hijri calendar, Azaan timings reminder, Count the tasbeeh.",
    androidLink: "https://play.google.com/store/apps/details?id=com.jmmtechnologies.hijricalendar&hl=en&gl=us",
    iosLink: "https://apps.apple.com/us/app/hijria/id1623978880?uo=4",
    screenshots: [
  
    "assets/project/hijriApp/screenshot1.png",
    "assets/project/hijriApp/screenshot2.png",
   "assets/project/hijriApp/screenshot3.png",
    "assets/project/hijriApp/screenshot4.png",
    "assets/project/hijriApp/screenshot5.png",
    "assets/project/hijriApp/screenshot6.png",
    ],
    techStack: ["Flutter", "Dart", "bloc", "Firebase"],
  ), ProjectUtils(
    image: "assets/project/exchnageapp/icon.png",
    title: "Exchange App",
    subtitle: "At c-Exchange.com, we are committed to providing our customers with the highest levels of trust, security, and credibility. We understand that when you come to us for services, you expect the best. That's why we strive to make sure that your experience with us is as safe, secure, and reliable as possible.\n\nBlockchain solution for all\nWe are the leading Bitcoin, CryptoCurrency, and Blockchain platform in Africa, and we are dedicated to simplifying this revolutionary technology for everyone. Our app offers you the most convenient and flexible way to buy, sell, store, send, receive, and convert between cryptocurrencies, shop online with nationwide delivery, and pay bills. We are constantly working to add more features and services to our platform, so you can always expect the best from us.\n\nUse our App\nAt c-Exchange, you can be sure that you will get the best rates, fees, customer support, flexible terms, security, speed, and reliability. We have everything you need here, and we are always looking for ways to exceed your expectations.\n\nTrade & Store Bitcoin\nYou can also send and receive your Bitcoin and other cryptocurrencies from any platform instantly, or store them securely in your c-Exchange wallet until you're ready to withdraw. Plus, you can share your c-Exchange referral link and earn a commission for each friend who joins and uses the app for any of our services.\n\nIf you ever need help, don't hesitate to reach out to us. Just send a message to support@c-exchange.com and we'll get back to you as soon as possible.",
    androidLink: "https://play.google.com/store/apps/details?id=com.cexchange.app&hl=en&gl=us",
    iosLink: "https://play.google.com/store/apps/details?id=com.cexchange.app&hl=en&gl=us",
    screenshots: [
  
    "assets/project/exchnageapp/screenshot1.png",
    "assets/project/exchnageapp/screenshot2.png",
     "assets/project/exchnageapp/screenshot3.png",
    "assets/project/exchnageapp/screenshot4.png",
     "assets/project/exchnageapp/screenshot5.png",
    "assets/project/exchnageapp/screenshot6.png",
    ],
    techStack: ["Flutter", "Dart", "bloc", "Firebase"],
  ),
  ProjectUtils(
    image: "assets/project/smartcv.png",
    title: "Resume Builder App",
    subtitle: "Contributed to the Smart CV application on Google Play by developing UI elements and templates.",
    androidLink: "https://play.google.com/store/apps/details?id=com.resumebuilder.cvmaker.cvtemplate.resumetemplate",
    iosLink: "https://play.google.com/store/apps/details?id=com.resumebuilder.cvmaker.cvtemplate.resumetemplate",
    screenshots: [
      "assets/project/resume/3.jpeg",
      "assets/project/resume/1.jpeg",  
      "assets/project/resume/4.jpeg",
      "assets/project/resume/2.jpeg",
      "assets/project/resume/home.png",
      "assets/project/resume/cvTemp.png",
      "assets/project/resume/fields.png",
      "assets/project/resume/coverl.png",
      "assets/project/resume/covert.png",
      "assets/project/resume/covertemp.png",
      
      
    ],
    techStack: ["Flutter", "Dart", "Firebase"],
  ),
  ProjectUtils(
    image: "assets/project/e_commerce/ecommercelogo.png",
    title: "E_Commerce App",
    subtitle: "Developed a comprehensive e-commerce app featuring product browsing, user authentication, shopping cart, secure checkout, order tracking, and payment integration for a seamless shopping experience.",
    androidLink: "https://github.com/Mohsinkhani/Ringtone_App",
    iosLink: "https://github.com/Mohsinkhani/e_commerce",
    screenshots: [
      "assets/project/e_commerce/home1.png",
      "assets/project/e_commerce/popularProducts.png",
      "assets/project/e_commerce/PriceFilter.png",
      "assets/project/e_commerce/productDetails1.png",
      "assets/project/e_commerce/productDetails2.png",
      "assets/project/e_commerce/allbrands.png",
      "assets/project/e_commerce/brands.png",
         "assets/project/e_commerce/salesproduct.png",
      "assets/project/e_commerce/cart.png",
      "assets/project/e_commerce/orders.png",
      "assets/project/e_commerce/profile1.png",
      "assets/project/e_commerce/profile2.png",
      "assets/project/e_commerce/profileDetails.png",
   

    ],
    techStack: ["Flutter", "Dart", "Bloc", "Firebase", "Firestore", "Dio", "CachedNetworkImage", "Flutter Local Notifications",],
  ),
  ProjectUtils(
    image: "assets/project/sps/spslogo.png",
    title: "Saudi Project Support",
    subtitle: "Developed a Application for SaudiPS to showcase services like transport, accommodation, catering, and IT, supporting projects with tailored business solutions in Saudi Arabia.",
    androidLink: "https://github.com/Mohsinkhani/Flutter_SolidwasteApp",
    iosLink: "https://github.com/Mohsinkhani/Flutter_SolidwasteApp",
    screenshots: [
      "assets/project/sps/Feature Image.png",
      "assets/project/sps/Screenshot 54.png",
      "assets/project/sps/Screenshot 55.png",
      "assets/project/sps/Screenshot 56.png",
      "assets/project/sps/Screenshot 58.png",
      "assets/project/sps/Screenshot 59.png",
      "assets/project/sps/Screenshot 60.png",
      "assets/project/sps/Screenshot 61.png",
    ],
    techStack: ["Flutter", "Dart", "Provider","Firebase",],
  ),
  ProjectUtils(
    image: "assets/project/gym/gymlogo.png",
    title: "GYM App",
    subtitle: "Designed a GYM app UI with a BMI calculator, appointment scheduling, and trainer ratings.",
    androidLink: "https://github.com/Mohsinkhani/Gym-App",
    iosLink: "https://github.com/Mohsinkhani/Gym-App",
    screenshots: [
      "assets/project/gym/height.png",
       "assets/project/gym/weight.png",
        "assets/project/gym/goal.png",
         "assets/project/gym/login.png",
         "assets/project/gym/home.png",
          "assets/project/gym/workout.png",
         "assets/project/gym/workoutCategory.png",
         "assets/project/gym/video.png",
          "assets/project/gym/caloriescalc.png",
           "assets/project/gym/notification.png",
           "assets/project/gym/profile.png",
           "assets/project/gym/premium.png",
           "assets/project/gym/trainer.png",
     "assets/project/gym/trainerdetails.png",
      "assets/project/gym/appointment.png",
     "assets/project/gym/booking.png",
     "assets/project/gym/payment.png",
     "assets/project/gym/paymentcomplete.png",
    ],
    techStack: ["Flutter", "Dart", "Bloc","Firebase"],
  ),
  ProjectUtils(
    image: "assets/project/listenit/appicon.jpeg",
    title: "ListenIt App",
    subtitle: "Designed a Songs app using Flutter and Dart  Firebase, featuring a music player and playlist management.",
    androidLink: "https://github.com/Mohsinkhani/ListenIt-App",
    iosLink: "https://github.com/Mohsinkhani/ListenIt-App",
    screenshots: [
      "assets/project/listenit/login.png",
      "assets/project/listenit/home.png",
      "assets/project/listenit/search.png",
      "assets/project/listenit/library.png",
      "assets/project/listenit/playScreen.png",
      "assets/project/listenit/detailsScreen.png",
      "assets/project/listenit/premium.png",
      "assets/project/listenit/select_genre.png",
      "assets/project/listenit/profile.png",
  

    ],
    techStack: ["Flutter", "Dart", "Provider", "Firebase", "Firestore", "CachedNetworkImage", "Flutter Local Notifications"],
  ),
  ProjectUtils(
    image: "assets/project/grocery/applogo.png",
    title: "Grocery App",
    subtitle: "Designed a user-friendly grocery app with a simple UI, allowing easy browsing and shopping for all grocery items.",
    androidLink: "https://github.com/Mohsinkhani/pro_grocery",
    iosLink: "https://github.com/Mohsinkhani/pro_grocery",
    screenshots: [
         "assets/project/grocery/welcom.png",
         "assets/project/grocery/login.png",
          "assets/project/grocery/homescreen.png",
          "assets/project/grocery/allitems.png",
          "assets/project/grocery/detailsscreen.png",
           "assets/project/grocery/payment screen.png",
           "assets/project/grocery/orderplaced.png",
          "assets/project/grocery/addtocart.png",
          "assets/project/grocery/menu.png",
          "assets/project/grocery/cartscreen.png",
          "assets/project/grocery/profilescreen.png",
          "assets/project/grocery/ordertracking.png",
          "assets/project/grocery/coupenscreen.png",
          "assets/project/grocery/address.png",
          "assets/project/grocery/notification.png",
   
    ],
    techStack: ["Flutter", "Dart", "Firebase", "Firestore", "GetX", "Dio", "CachedNetworkImage", "Flutter Local Notifications"],
  ),
  ProjectUtils(
    image: "assets/project/truckease/trukeaselogo.png",
    title: "Truckease App",
    subtitle: "Designed a truck booking app with features like scheduled bookings, live delivery tracking, and in-app chat for real-time communications.",
    androidLink: "https://github.com/Mohsinkhani/truckease",
    iosLink: "https://github.com/Mohsinkhani/truckease",
    screenshots: [
       "assets/project/truckease/signup.png",
                "assets/project/truckease/homep.png",
                 "assets/project/truckease/filter.png",
                 "assets/project/truckease/calender.png",
         "assets/project/truckease/details.png",
         "assets/project/truckease/truckDetails.png",
                  "assets/project/truckease/payments.png",
                    "assets/project/truckease/chat.png",
           "assets/project/truckease/tracking.png",
          "assets/project/truckease/location.png",
         "assets/project/truckease/favorite.png",
         "assets/project/truckease/notifications.png",
         "assets/project/truckease/profiles.png",
        
   
    ],
    techStack: ["Flutter", "Dart", "Firebase", "Firestore"],
  ),
];