class TaskModel{
    String title;
    bool isDone;
     TaskModel({required this.title,this.isDone = false});

     Map<String,dynamic> toJson()=>{
        'title':title, 'isDone':isDone
     };

     factory TaskModel.fromJson(Map<String, dynamic> json) =>
      TaskModel(title: json['title'], isDone: json['isDone']);

}