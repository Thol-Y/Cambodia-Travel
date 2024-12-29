import 'package:cambodia_travel/model/province.dart';
import 'package:flutter/material.dart';

class ProvincesList extends StatefulWidget {
  const ProvincesList({super.key});

  @override
  State<ProvincesList> createState() => _ProvincesListState();
}

class _ProvincesListState extends State<ProvincesList> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: province.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              setState(() {
                selectIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: selectIndex == index ? Colors.blue[300] :Colors.transparent
              ),
              child: Column(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(province[index].img),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    province[index].name,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          );
        },
       
      ),
    );
    
  }
}
