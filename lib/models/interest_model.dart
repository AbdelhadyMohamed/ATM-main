class InterestModel{
  bool isSelected;
  final String name;
  final String image;

  InterestModel({this.isSelected = false, required this.name, required this.image,});
  factory InterestModel.empty(){
    return InterestModel(name: "Sport &", image: "https://cdn-icons-png.freepik.com/512/5351/5351478.png");
  }
}