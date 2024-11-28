class TodoModel{

  int id;
  String title;
  String description;
  String date;
  

  TodoModel(
    {
      required this.title,
      required this.description,
      required this.date,
      required this.id
    }
  );

  Map <String,dynamic> ml(){
    return{
      "title" : title,
      "description" : description,
      "date" : date,
      "id" : id,
    };
  }
}