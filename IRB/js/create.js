//Creates a new IRB based the details of the current activity
//wmalyk-ideate-2008


function update(activityURI, passFail){

    dat = new xmlAssembler(files.loadXML(activityURI + "/rules.xml"));
    turi = dat.getValue("targetURI");
    ref = dat.getValue("ref");
    linkeduri = dat.getValue("linkedProject");
    if(passFail){
        dat.setValue("status", "approved");
        if(linkeduri != ''){
            uri = linkeduri + "/data/projectData.xml";
            l = new xmlAssembler(files.loadXML(uri));
            rt = "compliance/IRBProtocol";
            l.setValue(rt + "/@status", "approved");
            l.setValue(rt, ref + ":approved");
            l.save(uri);
        }
    }else{        
        dat.setValue("status", "fail");
        if(linkeduri != ''){
            uri = linkeduri + "/data/projectData.xml";
            l = new xmlAssembler(files.loadXML(uri));
            rt = "compliance/IRBProtocol";
            l.setValue(rt + "/@status", "fail");
            l.setValue(rt, ref + ":rejected");
            l.save(uri);
        }

    }    
    
    dat.save(turi + "/data.xml");
}



//nodeType == IRB or IBC
function create(nodeType, inputs, pushback){
// inputs = {"linkedProject":targetID, "pi", "people":["", ""], "ref":ref}

    var me = Host.getCurrentUser();

    ref = inputs.targetID;
    if(ref == ""){
        ref = fetchNewNumber();
    }
    ref = ref + "-" + nodeType;

    if(nodeType=="IRB") pb = "irb_v1r0b0_CreateNew";
    if(nodeType=="IBC") pb = "ibc_v1r0b0_CreateNew";
    if(nodeType=="COI") pb = "coi_v1r0b0_CreateNew";
    
    ENTITY = nodeType + " Protocols"
    if(nodeType=="COI") ENTITY = "COI";
    var e = entities.createRecord(ENTITY);
    pi = "";
    name = "";
    if(inputs.targetURI){
        uri = inputs.targetURI + "/data/projectData.xml";
        l = new xmlAssembler(files.loadXML(uri));
        rt = "compliance/" + nodeType + "Protocol";
        l.setValue(rt + "/@entityID", e);
        l.setValue(rt + "/@status", "pending");
        l.setValue(rt, ref + ":pending");
        l.save(uri);
        pi = l.getValue("PIName");
        name = l.getValue("ProjectTitle");
    }

    if(nodeType!="COI"){
    dat = new xmlAssembler(files.loadXML(IRBPath + "/xml/" + nodeType + "/data.xml"));
    dat.setValue("ref", ref);
    if(pushback) pushback.ref = ref;
    dat.setValue("name", name);
    dat.setValue("Admin-Info/StudyTitle", name);
    dat.setValue("PI", pi);
    dat.setValue("linkedProject", inputs.targetURI);
    dat.setValue("targetURI", e);
    }
    var s = activity.launch("Create New " + nodeType, ref, processPath + "/" + pb, null, null , null, null, null, {"admin":Host.getCurrentUser().userId, "Reviewer":"Dhl62yIBAKi6wKkAvQve"});
    
    if(nodeType!="COI"){
    
    dat.setValue("activityURI", s.uri);
    dat.save(e + "/data.xml");
	dat.save(s.uri + "/rules.xml");
	}
	return s.id;    
}

function fetchNewNumber(){

    //Get new ID number
    var numberingDoc = rootPath + "/scripts/process-naming.xml";

    var numbering = data.createData(files.loadXML(numberingDoc));
    var ln = 1 * numbering.getValue("process/lastNum");
    var inc = 1 * numbering.getValue("process/incriment");
    var pre = numbering.getValue("process/pre-fix");
    var REF = ln + inc;
    numbering.setValue("process/lastNum", REF); 
    files.saveXML(numberingDoc, numbering.getDocument());
    REF = pre + REF;

    return REF;
}



/*
//Look for (and add the Person handling the project)
var target = me.simpleName;

var ls = data.createData(entities.recordList("People"));
var target = me.simpleName;
var match = ls.getValue("record[concat(FirstName, ' ', LastName) ='" + target + "']/@id");
var xml;
if(match != ""){    
    xml = entities.recordData("People", match).getDocument();

    //Transform/Generate Personnel Entry
    var outAdmin = data.createData(files.xslt(xml, files.loadXML(USBudgetPath + "/xslt/mkContact.xsl"), {"target":target}));

    //Refine Results
    var de = outAdmin.getValue("department");
    if(de){
        try{
            d = entities.recordData("Departments", de).getValue("Name");
        }catch (e){
            d = "unknown";
        }
	    outAdmin.setValue("department", d);
    }
    
    elpProDat.removeAll("AdminContact");
    elpProDat.append(outAdmin.getDocument());
}
elpProDat.save(e + "/data/projectData.xml");

*/