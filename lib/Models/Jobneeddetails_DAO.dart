class Jobneeddetails_DAO {
  int _id;
  int _jndid;
  int _jobneedid;
  int _seqno;
  int _questionid;
  String _answer;
  String _min;
  String _max;
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
      this._answer,
      this._min,
      this._max,
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
      this._answer,
      this._min,
      this._max,
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
  String get answer => _answer;
  String get min => _min;
  String get max => _max;
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

  set answer(String newanswer) {
    this._answer = newanswer;
  }

  set min(String newmin) {
    this._min = newmin;
  }

  set max(String newmax) {
    this._max = newmax;
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
    map['answer'] = _answer;
    map['min'] = _min;
    map['max'] = _max;
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
    this._answer = map['answer'];
    this._min = map['min'];
    this._max = map['max'];
    this._option = map['option'];
    this._alerton = map['alerton'];
    this._type = map['type'];
    this._cdtz = map['cdtz'];
    this._mdtz = map['mdtz'];
    this._cuser = map['cuser'];
    this._muser = map['muser'];
    this._ismandatory = map['ismandatory'];
  }
  toJson() {
    return {
      "jndid": jndid,
      "jobneedid": jobneedid,
      "seqno": seqno,
      "questionid": questionid,
      "answer": answer,
      "min": min,
      "max": max,
      "option": option,
      "alerton": alerton,
      "type": type,
      "cdtz": cdtz,
      "mdtz": mdtz,
      "cuser": cuser,
      "muser": muser,
      "ismandatory": ismandatory
    };
  }
}
