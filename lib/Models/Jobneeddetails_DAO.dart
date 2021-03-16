class Jobneeddetails_DAO {
  int _id;
  int _jndid;
  int _jobneedid;
  int _seqno;
  int _questionid;
  String _Answer;
  String _Min;
  String _Max;
  String _option;
  String _alerton;
  int _type;
  String _cdtz;
  String _mdtz;
  int _cuser;
  int _muser;
  String _ismandatory;

  Jobneeddetails_DAO(
      this._jndid,
      this._jobneedid,
      this._seqno,
      this._questionid,
      this._Answer,
      this._Min,
      this._Max,
      this._option,
      this._alerton,
      this._type,
      this._cdtz,
      this._mdtz,
      this._cuser,
      this._muser,
      this._ismandatory);

  Jobneeddetails_DAO.withId(
      this._id,
      this._jndid,
      this._jobneedid,
      this._seqno,
      this._questionid,
      this._Answer,
      this._Min,
      this._Max,
      this._option,
      this._alerton,
      this._type,
      this._cdtz,
      this._mdtz,
      this._cuser,
      this._muser,
      this._ismandatory);

  int get id => _id;
  int get jndid => _jndid;
  int get jobneedid => _jobneedid;
  int get seqno => _seqno;
  int get questionid => _questionid;
  String get Answer => _Answer;
  String get Min => _Min;
  String get Max => _Max;
  String get option => _option;
  String get alerton => _alerton;
  int get type => _type;
  String get cdtz => _cdtz;
  String get mdtz => _mdtz;
  int get cuser => _cuser;
  int get muser => _muser;
  String get ismandatory => _ismandatory;

  set jndid(int newjndid) {
    this._jndid = newjndid;
  }

  set jobneedid(int newjobneedid) {
    this._jobneedid = newjobneedid;
  }

  set seqno(int newseqno) {
    this._seqno = newseqno;
  }

  set questionid(int newquestionid) {
    this._questionid = newquestionid;
  }

  set Answer(String newAnswer) {
    this._Answer = newAnswer;
  }

  set Min(String newMin) {
    this._Min = newMin;
  }

  set Max(String newMax) {
    this._Max = newMax;
  }

  set option(String newoption) {
    this._option = newoption;
  }

  set alerton(String newalerton) {
    this._alerton = newalerton;
  }

  set type(int newtype) {
    this._type = newtype;
  }

  set cdtz(String newcdtz) {
    this._cdtz = newcdtz;
  }

  set mdtz(String newmdtz) {
    this._mdtz = newmdtz;
  }

  set cuser(int newcuser) {
    this._cuser = newcuser;
  }

  set muser(int newmuser) {
    this._muser = newmuser;
  }

  set ismandatory(String newismandatory) {
    this._ismandatory = newismandatory;
  }

  // Convert a Note   object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['jndid'] = _jndid;
    map['jobneedid'] = _jobneedid;
    map['seqno'] = _seqno;
    map['questionid'] = _questionid;
    map['Answer'] = _Answer;
    map['Min'] = _Min;
    map['Max'] = _Max;
    map['option'] = _option;
    map['alerton'] = _alerton;
    map['type'] = _type;
    map['cdtz'] = _cdtz;
    map['mdtz'] = _mdtz;
    map['cuser'] = _cuser;
    map['muser'] = _muser;
    map['ismandatory'] = _ismandatory;
    return map;
  }

  // Extract a Note object from a Map object
  Jobneeddetails_DAO.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._jndid = map['jndid'];
    this._jobneedid = map['jobneedid'];
    this._seqno = map['seqno'];
    this._questionid = map['questionid'];
    this._Answer = map['Answer'];
    this._Min = map['Min'];
    this._Max = map['Max'];
    this._option = map['option'];
    this._alerton = map['alerton'];
    this._type = map['type'];
    this._cdtz = map['cdtz'];
    this._mdtz = map['mdtz'];
    this._cuser = map['cuser'];
    this._muser = map['muser'];
    this._ismandatory = map['ismandatory'];
  }
}
