class QuestionSetBelong_DAO {
  int _id;
  int _qsbid;
  String _ismandatory;
  int _seqno;
  int _questionsetid;
  int _questionid;
  String _cdtz;
  String _mdtz;
  String _isdeleted;
  int _cuser;
  int _muser;
  String _Min;
  String _Max;
  String _alertOn;
  String _option;
  int _buid;

  QuestionSetBelong_DAO(
      this._qsbid,
      this._ismandatory,
      this._seqno,
      this._questionsetid,
      this._questionid,
      this._cdtz,
      this._mdtz,
      this._isdeleted,
      this._cuser,
      this._muser,
      this._Min,
      this._Max,
      this._alertOn,
      this._option,
      this._buid);

  QuestionSetBelong_DAO.withId(
      this._id,
      this._qsbid,
      this._ismandatory,
      this._seqno,
      this._questionsetid,
      this._questionid,
      this._cdtz,
      this._mdtz,
      this._isdeleted,
      this._cuser,
      this._muser,
      this._Min,
      this._Max,
      this._alertOn,
      this._option,
      this._buid);

  int get id => _id;
  int get qsbid => _qsbid;
  String get ismandatory => _ismandatory;
  int get seqno => _seqno;
  int get questionsetid => _questionsetid;
  int get questionid => _questionid;
  String get cdtz => _cdtz;
  String get mdtz => _mdtz;
  String get isdeleted => _isdeleted;
  int get cuser => _cuser;
  int get muser => _muser;
  String get Min => _Min;
  String get Max => _Max;
  String get alertOn => _alertOn;
  String get option => _option;
  int get buid => _buid;

  set qsbid(int newqsbid) {
    this._qsbid = newqsbid;
  }

  set ismandatory(String newismandatory) {
    this._ismandatory = newismandatory;
  }

  set seqno(int newseqno) {
    this._seqno = newseqno;
  }

  set questionsetid(int newquestionsetid) {
    this._questionsetid = newquestionsetid;
  }

  set questionid(int newquestionid) {
    this._questionid = newquestionid;
  }

  set cdtz(String newcdtz) {
    this._cdtz = newcdtz;
  }

  set mdtz(String newmdtz) {
    this._mdtz = newmdtz;
  }

  set isdeleted(String newisdeleted) {
    this._isdeleted = newisdeleted;
  }

  set cuser(int newcuser) {
    this._cuser = newcuser;
  }

  set muser(int newmuser) {
    this._muser = newmuser;
  }

  set Min(String newMin) {
    this._Min = newMin;
  }

  set Max(String newMax) {
    this._Max = newMax;
  }

  set alertOn(String newalertOn) {
    this._alertOn = newalertOn;
  }

  set option(String newoption) {
    this._option = newoption;
  }

  set buid(int newbuid) {
    this._buid = newbuid;
  }

  // Convert a Note   object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['qsbid'] = _qsbid;
    map['ismandatory'] = _ismandatory;
    map['seqno'] = _seqno;
    map['questionsetid'] = _questionsetid;
    map['questionid'] = _questionid;
    map['cdtz'] = _cdtz;
    map['mdtz'] = _mdtz;
    map['isdeleted'] = _isdeleted;
    map['cuser'] = _cuser;
    map['muser'] = _muser;
    map['Min'] = _Min;
    map['Max'] = _Max;
    map['alertOn'] = _alertOn;
    map['option'] = _option;
    map['buid'] = _buid;
    return map;
  }

  // Extract a Note object from a Map object
  QuestionSetBelong_DAO.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._qsbid = map['qsbid'];
    this._ismandatory = map['ismandatory'];
    this._seqno = map['seqno'];
    this._questionsetid = map['questionsetid'];
    this._questionid = map['questionid'];
    this._cdtz = map['cdtz'];
    this._mdtz = map['mdtz'];
    this._isdeleted = map['isdeleted'];
    this._cuser = map['cuser'];
    this._muser = map['muser'];
    this._Min = map['Min'];
    this._Max = map['Max'];
    this._alertOn = map['alertOn'];
    this._option = map['option'];
    this._buid = map['buid'];
  }
}
