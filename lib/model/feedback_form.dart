class FeedbackForm
{
  String _name;
  String _email;
  String _mobileNo;
  String _feedback;

  FeedbackForm(this._name,this._email,this._mobileNo,this._feedback);

  String toParams() => "?name=$_name&email=$_email&mobileno=$_mobileNo&feedback=$_feedback";

}