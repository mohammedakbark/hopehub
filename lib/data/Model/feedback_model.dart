class FeedbackModel{
  String email;
  String feedback;
  String ? id;

  FeedbackModel({
  required this.email,
  required this.feedback,
  this.id
});
Map<String,dynamic>data(docId)=>{
  "email":email,
  "feedback":feedback,
  "id":docId
};
factory FeedbackModel.fromData(Map<String,dynamic>i){
  return FeedbackModel(
    email: i["email"], 
    feedback: i["feedback"]);
}
}
