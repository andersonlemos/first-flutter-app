class Item{
  String title;
  bool done;

  Item({this.title,this.done});

  Item.fromJson(Map<String, dynamic> json){
    this.title = json['title'];
    this.done = json['done'];
  }
  Map<String, dynamic> toJson(Map<String, dynamic> json){
   final Map<String, dynamic> data = new Map<String,dynamic>();

    data['title'] = this.title;
    data['done'] = this.done;

    return data;
  }




}