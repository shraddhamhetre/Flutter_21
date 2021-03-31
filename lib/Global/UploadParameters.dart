class UploadJobneedParameter{
    String aatop, assetid, buid, cdtz, ctzoffset, cuser, endtime, expirydatetime,
        frequency, gpslocation, gracetime, groupid, identifier, jobdesc, jobid,
        jobneedid, jobstatus, jobtype, mdtz, multiplicationfactor, muser, parent,
        peopleid, performedby, plandatetime, priority,questionsetid, receivedonserver,
        remarks, scantype, starttime, syncstatus, ticketcategory, othersite;
    List details=[];

    UploadJobneedParameter(this.aatop, this.assetid, this.buid, this.cdtz, this.ctzoffset,
        this.cuser, this.endtime, this.expirydatetime, this.frequency, this.gpslocation,
        this.gracetime, this.groupid, this.identifier,this.jobdesc, this.jobid, this.jobneedid,
        this.jobstatus, this.jobtype, this.mdtz, this.multiplicationfactor, this.muser,
        this.parent, this.peopleid, this.performedby,this.plandatetime, this.priority,
        this.questionsetid, this.receivedonserver, this.remarks, this.scantype,
        this.starttime, this.syncstatus, this.ticketcategory, this.details, this.othersite);

    toJson() {
        return {
            "\"aatop\"": aatop,
            "\"assetid\"": assetid,
            "\"buid\"": buid,
            "\"cdtz\"": "\""+cdtz+"\"",
            "\"ctzoffset\"": "\""+ctzoffset+"\"",
            "\"cuser\"": cuser,
            "\"endtime\"": "\""+endtime+"\"",
            "\"expirydatetime\"": "\""+expirydatetime+"\"",
            "\"frequency\"": frequency,
            "\"gpslocation\"": "\""+gpslocation+"\"",
            "\"gracetime\"": gracetime,
            "\"groupid\"": groupid,
            "\"identifier\"": identifier,
            "\"jobdesc\"": "\""+jobdesc+"\"",
            "\"jobid\"": jobid,
            "\"jobneedid\"": jobneedid,
            "\"jobstatus\"": jobstatus,
            "\"jobtype\"": jobtype,
            "\"mdtz\"": "\""+mdtz+"\"",
            "\"multiplicationfactor\"": multiplicationfactor,
            "\"muser\"": muser,
            "\"parent\"": parent,
            "\"peopleid\"": peopleid,
            "\"plandatetime\"": "\""+plandatetime+"\"",
            "\"priority\"": priority,
            "\"questionsetid\"": questionsetid,
            "\"receivedonserver\"": "\""+receivedonserver+"\"",
            "\"remarks\"": "\""+remarks+"\"",
            "\"scantype\"": scantype,
            "\"starttime\"": "\""+starttime+"\"",
            "\"syncstatus\"": syncstatus,
            "\"ticketcategory\"": ticketcategory,
            "\"details\"": details.toList(),

        };
    }
}

class UploadJNDData{
    String jobneedid, answer, jndid, questionid, type, parent, seqno;
    UploadJNDData(this.jobneedid, this.answer, this.jndid, this.questionid, this.type, this.parent, this.seqno);
    toJson()
    {
        return {
            "\"jobneedid\"":   "\""+jobneedid+"\"",
            "\"answer\"":      "\""+answer+"\"",
            "\"jndid\"":       "\""+jndid+"\"",
            "\"questionid\"":  "\""+questionid+"\"",
            "\"type\"":        "\""+type+"\"",
            "\"parent\"":      "\""+"-1"+"\"",
            "\"seqno\"":      "\""+"1"+"\""

        };
    }
}
class UploadParameter{
    String servicename,query,story,biodata,info,sitecode,loginid,password,tzoffset,deviceid;

    UploadParameter(this.servicename, this.query, this.story, this.biodata, this.info,
        this.sitecode, this.loginid, this.password, this.tzoffset, this.deviceid);

    Map<String, String> toJson() {
        return {
            "\"servicename\"" : '"'+servicename+'"',
            "\"biodata\""     : '"'+biodata.replaceAll("\"", "\\\"")+'"',
            "\"story\""       : '"'+story+'"',
            "\"query\""       : '"'+query+'"',
            "\"info\""        : '"'+info.replaceAll("\"", "\\\"")+'"',
            "\"sitecode\""    : '"'+sitecode+'"',
            "\"loginid\""     : '"'+loginid+'"',
            "\"password\""    : '"'+password+'"',
            "\"tzoffset\""    : '"'+tzoffset+'"',
            "\"deviceid\""    : '"'+deviceid+'"'
        };
    }
}

class PeopleEventLog{
    String pelogid, accuracy, deviceid, datetime, gpslocation, photorecognitionthreshold, photorecognitionscore,
        photorecognitiontimestamp,  photorecognitionserviceresponse, facerecognition, peopleid, peventtype,
        punchstatus, verifiedby, gfid, buid, cuser, muser, cdtz, mdtz, transportmode, expamt, duration, reference,
        remarks, distance, ctzoffset, otherlocation, syncstatus;
    PeopleEventLog(this.pelogid, this.accuracy, this.deviceid, this.datetime, this.gpslocation, this.photorecognitionthreshold,
        this.photorecognitionscore, this.photorecognitiontimestamp,  this.photorecognitionserviceresponse, this.facerecognition,
        this.peopleid, this.peventtype, this.punchstatus, this.verifiedby, this.gfid, this.buid, this.cuser, this.muser, this.cdtz,
        this.mdtz, this.transportmode, this.expamt, this.duration, this.reference, this.remarks, this.distance, this.ctzoffset, this.otherlocation,this.syncstatus);
    toJson() {
        return {
            "pelogid": pelogid,
            "accuracy": accuracy,
            "deviceid": deviceid,
            "datetime": datetime,
            "gpslocation": gpslocation,
            "photorecognitionthreshold": photorecognitionthreshold,
            "photorecognitionscore": photorecognitionscore,
            "photorecognitiontimestamp": photorecognitiontimestamp,
            "photorecognitionserviceresponse": photorecognitionserviceresponse,
            "facerecognition": facerecognition,
            "peopleid": peopleid,
            "peventtype": peventtype,
            "punchstatus": punchstatus,
            "verifiedby": verifiedby,
            "gfid": gfid,
            "buid": buid,
            "cuser": cuser,
            "muser": muser,
            "cdtz": cdtz,
            "mdtz": mdtz,
            "transportmode": transportmode,
            "expamt": expamt,
            "duration": duration,
            "reference": reference,
            "remarks": remarks,
            "distance": distance,
            "ctzoffset": ctzoffset,
            "otherlocation": otherlocation,
            "syncstatus": syncstatus

        };
    }
}
class PeopleEventLogUp{
    String pelogid, accuracy, deviceid, datetime, gpslocation, photorecognitionthreshold, photorecognitionscore,
        photorecognitiontimestamp,  photorecognitionserviceresponse, facerecognition, peopleid, peventtype,
        punchstatus, verifiedby, gfid, buid, cuser, muser, cdtz, mdtz, transportmode, expamt, duration, reference,
        remarks, distance, ctzoffset, otherlocation, syncstatus;
    PeopleEventLogUp(this.pelogid, this.accuracy, this.deviceid, this.datetime, this.gpslocation, this.photorecognitionthreshold,
        this.photorecognitionscore, this.photorecognitiontimestamp,  this.photorecognitionserviceresponse, this.facerecognition,
        this.peopleid, this.peventtype, this.punchstatus, this.verifiedby, this.gfid, this.buid, this.cuser, this.muser, this.cdtz,
        this.mdtz, this.transportmode, this.expamt, this.duration, this.reference, this.remarks, this.distance, this.ctzoffset, this.otherlocation,this.syncstatus);
    toJson() {
        return {
            "\"pelogid\"": pelogid,
            "\"accuracy\"": accuracy,
            "\"deviceid\"": deviceid,
            "\"datetime\"": "\""+datetime+"\"",
            "\"gpslocation\"": "\""+gpslocation+"\"",
            "\"photorecognitionthreshold\"": photorecognitionthreshold,
            "\"photorecognitionscore\"": photorecognitionscore,
            "\"photorecognitiontimestamp\"": "\""+photorecognitiontimestamp+"\"",
            "\"photorecognitionserviceresponse\"": "\""+photorecognitionserviceresponse+"\"",
            "\"facerecognition\"": "\""+facerecognition+"\"",
            "\"peopleid\"": peopleid,
            "\"peventtype\"": peventtype,
            "\"punchstatus\"": punchstatus,
            "\"verifiedby\"": verifiedby,
            "\"gfid\"": gfid,
            "\"buid\"": buid,
            "\"cuser\"": cuser,
            "\"muser\"": muser,
            "\"cdtz\"": "\""+cdtz+"\"",
            "\"mdtz\"": "\""+mdtz+"\"",
            "\"transportmode\"": transportmode,
            "\"expamt\"": expamt,
            "\"duration\"": duration,
            "\"reference\"": "\""+reference+"\"",
            "\"remarks\"": "\""+remarks+"\"",
            "\"distance\"": distance,
            "\"ctzoffset\"": ctzoffset,
            "\"otherlocation\"": "\""+otherlocation+"\"",
            "\"syncstatus\"": syncstatus

        };
    }
}
class UploadInfoParameter{
    String mail, event;

    UploadInfoParameter(this.mail, this.event);
    toJson() {
        return {
            "\"mail\"": "\""+mail+"\"",
            "\"event\"": "\""+event+"\"",
        };
    }
}