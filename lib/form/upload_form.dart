class FeedbackForm {

  String _branch;
  String _semester;
  String _subject;
  String _module;
  String _drivelink;

  FeedbackForm(this._branch, this._semester, this._subject,this._module,this._drivelink );

  // Method to make GET parameters.
  String toParams() =>
      "?branch=$_branch&semester=$_semester&subject=$_subject&module=$_module&drivelink=$_drivelink";


}