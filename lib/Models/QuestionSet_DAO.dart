class QuestionSet_DAO {
  int _id;
  int _questionsetid;
  String _assetid;
  String _qsetname;
  String _seqno;
  String _enable;
  String _cuser;
  String _cdtz;
  String _muser;
  String _mdtz;

  QuestionSet_DAO(
      this._questionsetid,
      this._assetid,
      this._qsetname,
      this._seqno,
      this._enable,
      this._cuser,
      this._cdtz,
      this._muser,
      this._mdtz);

  QuestionSet_DAO.withId(
      this._id,
      this._questionsetid,
      this._assetid,
      this._qsetname,
      this._seqno,
      this._enable,
      this._cuser,
      this._cdtz,
      this._muser,
      this._mdtz);

  int get id => _id;
  int get questionsetid => _questionsetid;
  String get assetid => _assetid;
  String get qsetname => _qsetname;
  String get seqno => _seqno;
  String get enable => _enable;
  String get cuser => _cuser;
  String get cdtz => _cdtz;
  String get muser => _muser;
  String get mdtz => _mdtz;

  set questionsetid(int newquestionsetid) {
    this._questionsetid = newquestionsetid;
  }

  set assetid(String newassetid) {
    this._assetid = newassetid;
  }

  set qsetname(String newqsetname) {
    this._qsetname = newqsetname;
  }

  set seqno(String newseqno) {
    this._seqno = newseqno;
  }

  set enable(String newenable) {
    this._enable = newenable;
  }

  set cuser(String newcuser) {
    this._cuser = newcuser;
  }

  set cdtz(String newcdtz) {
    this._cdtz = newcdtz;
  }

  set muser(String newmuser) {
    this._muser = newmuser;
  }

  set mdtz(String newmdtz) {
    this._mdtz = newmdtz;
  }

  // Convert a Note   object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['questionsetid'] = _questionsetid;
    map['assetid'] = _assetid;
    map['qsetname'] = _qsetname;
    map['seqno'] = _seqno;
    map['enable'] = _enable;
    map['cuser'] = _cuser;
    map['cdtz'] = _cdtz;
    map['muser'] = _muser;
    map['mdtz'] = _mdtz;
    return map;
  }

  // Extract a Note object from a Map object
  QuestionSet_DAO.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._questionsetid = map['questionsetid'];
    this._assetid = map['assetid'];
    this._qsetname = map['qsetname'];
    this._seqno = map['seqno'];
    this._enable = map['enable'];
    this._cuser = map['cuser'];
    this._cdtz = map['cdtz'];
    this._muser = map['muser'];
    this._mdtz = map['mdtz'];
  }
}
