class ProjectModel {
  final String imageUrl;
  final String title;
  final String techUsed;
  ProjectModel({required this.imageUrl, required this.title, required this.techUsed});
}

class SkillModel {
  final String imageUrl;
  final String title;
  SkillModel({required this.imageUrl, required this.title});
}

List<ProjectModel> ProjectsData = [
  ProjectModel(imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Godot_icon.svg/1200px-Godot_icon.svg.png", title: "Simple RPG Game", techUsed: "Godot engine"),
  ProjectModel(imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Godot_icon.svg/1200px-Godot_icon.svg.png", title: "Twitter Clone", techUsed: "Django/Bootstrap"),
  ProjectModel(imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Godot_icon.svg/1200px-Godot_icon.svg.png", title: "Telegram Clone", techUsed: "Flutter/Firebase"),
  ProjectModel(imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Godot_icon.svg/1200px-Godot_icon.svg.png", title: "Ecommerce full", techUsed: "Flutter/Firebase"),
  ProjectModel(imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Godot_icon.svg/1200px-Godot_icon.svg.png", title: "Workout website", techUsed: "Next/React/Tailwind"),
  ProjectModel(imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Godot_icon.svg/1200px-Godot_icon.svg.png", title: "Todo List", techUsed: "React/Tailwind"),
  ProjectModel(imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Godot_icon.svg/1200px-Godot_icon.svg.png", title: "Todo List", techUsed: "Flutter/Sqlite"),
  ProjectModel(imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Godot_icon.svg/1200px-Godot_icon.svg.png", title: "Full workout tracker", techUsed: "Kivy/KivyMD"),
];


List<SkillModel> SkillsData = [
  SkillModel(imageUrl: "https://static-00.iconduck.com/assets.00/pytorch-icon-1694x2048-jgwjy3ne.png", title: "Pytorch"),
  SkillModel(imageUrl: "https://pbs.twimg.com/profile_images/1103339571977248768/FtFnqC38_400x400.png", title: "Tensorflow"),
  SkillModel(imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Godot_icon.svg/1200px-Godot_icon.svg.png", title: "Godot Engine"),
  SkillModel(imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1C22FFwpti_eYUR6o5Sa11dZp60PA01tsMA&s", title: "Pygame"),
  SkillModel(imageUrl: "https://upload.wikimedia.org/wikipedia/commons/5/58/Kivy_logo.png", title: "Kivy"),
  SkillModel(imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3ioErrXCaT2yZgsMaefs8irg9dRTWVk882Q&s", title: "SciKit-Learn"),
  SkillModel(imageUrl: "https://w7.pngwing.com/pngs/679/344/png-transparent-wing-ide-integrated-development-environment-python-computer-software-eric-raspberry-miscellaneous-monochrome-computer-program-thumbnail.png", title: "Tkinter"),
  SkillModel(imageUrl: "https://icon2.cleanpng.com/20180609/ep/aa8f7bv0c.webp", title: "PyQT"),
  SkillModel(imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6YE2GVhm_mJWiHhEj2kTvWlSGaHGEeBiinA&s", title: "React"),
  SkillModel(imageUrl: "https://www.drupal.org/files/project-images/nextjs-icon-dark-background.png", title: "Next js"),
  SkillModel(imageUrl: "https://www.drupal.org/files/project-images/screenshot_361.png", title: "Tailwind css"),
  SkillModel(imageUrl: "https://www.shutterstock.com/image-vector/html5-css3-js-icon-set-260nw-1668434533.jpg", title: "HTML/Css"),
  SkillModel(imageUrl: "https://e7.pngegg.com/pngimages/356/251/png-clipart-java-development-kit-java-architecture-for-xml-binding-java-runtime-environment-javafx-others-miscellaneous-text-thumbnail.png", title: "JavaFX"),
  SkillModel(imageUrl: "https://upload.wikimedia.org/wikipedia/commons/1/19/C_Logo.png", title: "C"),
  SkillModel(imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/ISO_C%2B%2B_Logo.svg/1822px-ISO_C%2B%2B_Logo.svg.png", title: "C++"),
  SkillModel(imageUrl: "https://go.dev/blog/go-brand/Go-Logo/PNG/Go-Logo_Blue.png", title: "GoLang"),
  SkillModel(imageUrl: "https://logowik.com/content/uploads/images/rust8244.jpg", title: "Rust"),
  SkillModel(imageUrl: "https://logosandtypes.com/wp-content/uploads/2021/04/Flutter.png", title: "Flutter"),
  SkillModel(imageUrl: "https://banner2.cleanpng.com/20180904/xhu/kisspng-logo-image-computer-icons-php-portable-network-gra-william-davies-meng-mongodb-1713944344684.webp", title: "PHP"),
  SkillModel(imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Logo_C_sharp.svg/910px-Logo_C_sharp.svg.png", title: "C#"),
  SkillModel(imageUrl: "https://cdn.iconscout.com/icon/free/png-256/free-django-logo-icon-download-in-svg-png-gif-file-formats--community-company-brand-world-logos-vol-8-pack-icons-282855.png?f=webp&w=256", title: "Django"),
  SkillModel(imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmD38KsMgEwahtWc_Nfs5ZVktP9dBc36MUZA&s", title: "Flask"),
  SkillModel(imageUrl: "https://w7.pngwing.com/pngs/925/447/png-transparent-express-js-node-js-javascript-mongodb-node-js-text-trademark-logo.png", title: "Express"),
  SkillModel(imageUrl: "https://static-00.iconduck.com/assets.00/node-js-icon-454x512-nztofx17.png", title: "Node"),
  SkillModel(imageUrl: "https://w7.pngwing.com/pngs/525/959/png-transparent-microsoft-azure-sql-database-microsoft-sql-server-cloud-computing-text-trademark-logo-thumbnail.png", title: "SQL"),
  SkillModel(imageUrl: "https://mathiasfrohlich.gallerycdn.vsassets.io/extensions/mathiasfrohlich/kotlin/1.7.1/1581441165235/Microsoft.VisualStudio.Services.Icons.Default", title: "Kotlin"),

];