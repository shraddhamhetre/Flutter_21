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
