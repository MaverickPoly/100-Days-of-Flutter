import "package:flutter/material.dart";
import "data.dart";


class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) => LinearGradient(colors: [
                      Colors.blue.shade400,
                      Colors.orange.shade800,
                    ]).createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                    child: const Text("Projects made by me.", textAlign: TextAlign.start, style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ProjectsData.length,
                    itemBuilder: (context, index) {
                      ProjectModel currentProject = ProjectsData[index];
                      return Card(
                        child: Row(
                          children: [
                            Image.network(currentProject.imageUrl, height: 120,),
                            const SizedBox(width: 20),
                            Column(
                              children: [
                                Text(currentProject.title, textAlign: TextAlign.center ,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24,)),
                                Text("Tech: ${currentProject.techUsed}", textAlign: TextAlign.start, style: const TextStyle(fontSize: 14,color: Colors.grey))
                              ],
                            )
                          ]
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
