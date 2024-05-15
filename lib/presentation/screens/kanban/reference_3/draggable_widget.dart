import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kanban/presentation/utils/app_texts.dart';

class DraggableWidget extends StatefulWidget {
  const DraggableWidget({super.key});

  @override
  State<DraggableWidget> createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {

  List data = [
  {
    'title': 'To Do', 'status': 'todo', 'count': 2
  },
  {
    'title': 'In Progress', 'status': 'in progress', 'count': 3
  },
  {
    'title': 'Blocked', 'status': 'blocked', 'count': 1
  },
  {
    'title': 'Completed', 'status': 'completed', 'count': 4
  },
  ];

  int maxVal = 4;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Draggable Widget Example'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: (maxVal * 224) + 15,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, mainIndex){
              return  SizedBox(width: 200,
                child:  DragTarget<int>(
                  onAccept: (oldIndex) {
                    print('Old index: $oldIndex');
                    print('New index: $mainIndex');

                    data[oldIndex]['count'] -= 1;
                    data[mainIndex]['count'] += 1;

                    int temp = 0;
                    for (var element in data) {
                      if(element['count']>temp){
                        temp = element['count'];
                      }
                    }
                    setState(() {
                      maxVal = temp;

                      print('Updated list: $data, $maxVal');

                    });
                  },
                  builder: (context, candidateData, rejectedData) {
                    if(data[mainIndex]['count']==0){
                      return Column(
                        children: [
                          Header(
                            title: data[mainIndex]['title'],
                            status: data[mainIndex]['status'],
                            onTapFunc: (){
                              setState(() {
                                data[mainIndex]['count']+=1;
                              });
                            },
                          ),
                          SizedBox(height: 8),
                          AppTexts.labelText(
                              textProperties: TextProperties(
                                  text: 'No Data available',
                                textColor: Colors.black
                              )
                          ),
                        ],
                      );
                    }

                    return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, subIndex){
                          if(subIndex==0){
                            return Column(
                              children: [
                                Header(
                                  title: data[mainIndex]['title'],
                                  status: data[mainIndex]['status'],
                                  onTapFunc: (){
                                    setState(() {
                                      data[mainIndex]['count']+=1;
                                    });
                                    print(data);
                                  },
                                ),
                                const SizedBox(height: 8),
                                Tile(mainIndex: mainIndex,),
                              ],
                            );
                          }

                          return       Tile(mainIndex: mainIndex,);
                        },
                        separatorBuilder: (context, index){
                          return SizedBox(height: 24,);
                        }, itemCount: data[mainIndex]['count']);
                  },
                ),
              );
            }, separatorBuilder: (context, index){
              return const SizedBox(width: 24,);
            }, itemCount: data.length),
          ),
        )
      ),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({
    super.key,
    required this.mainIndex
  });
  final int mainIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.blue,
      child: Draggable(
        data: mainIndex,
        feedback: Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        child: Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
        childWhenDragging: Container(),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.title,
    required this.status,
    required this.onTapFunc,
  });

  final String title, status;
  final Function() onTapFunc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppTexts.headingText(
              textProperties: TextProperties(
                  text: title,
                textColor: Colors.black
              )
          ),
          GestureDetector(
            onTap: onTapFunc,
              child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
