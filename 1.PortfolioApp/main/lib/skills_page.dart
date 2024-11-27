import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:lottie/lottie.dart";
import "package:main/data.dart";



class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Lottie.network("https://lottie.host/4f7ea69d-d766-46f7-b7bd-a76a0fa93bcb/7ysXehWBfR.json", height: 160, width: 160),
            SizedBox(height: 14),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: SkillsData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1/1.3),
                itemBuilder: (context, index) {
                  SkillModel currentSkill = SkillsData[index];
                  return Container(
                    padding: const EdgeInsets.all(6),
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey.shade300),
                    child: Column(
                      children: [
                        Image.network(currentSkill.imageUrl, height: 100,),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Text(currentSkill.title, textAlign: TextAlign.start, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),),
                        ),
                      ],
                    )
                  );
                })
          ],
        ),
      ),
    );
  }
}
