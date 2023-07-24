files.runScript("/system/resources/environment.js");
files.runScript(ideatePath + "/js/json2.js");
files.runScript(ideatePath + "/js/xmlAssembler.js");

function generateId(app){
    files.runScript(servicePath + "/idGenerator/main.js");
    var idGen = new idGenerator({"app":app});
    idGen.call();
    return idGen.output;
};

entUri = entities.createRecord(entity);
res = entUri;

if(mode == "basic"){
 if(id != ""){
    entDat = new xmlAssembler(files.loadXML(entUri + "/data.xml"));
    entDat.setValue("id8ID", id);
    entDat.setValue("id", id);
    entDat.save(entUri + "/data.xml")
 }
}else{
 entDat = new xmlAssembler(files.loadXML(entUri + "/data.xml"));
 copyIn = rootPath + "/configs/" + entity + "/datamodel/templates";
 files.copy(copyIn + "/lifecycle.xml", entUri + "/lifecycle.xml");
 files.copy(copyIn + "/data", entUri + "/data");
 if(id == ""){
   id = generateId(entity);
 }
 entDat.setValue("id8ID", id);
 entDat.setValue("id", id);
 if(pi != ""){
   entDat.setValue("piREF", pi);
 }
 if(dept != ""){
   entDat.setValue("deptREF", dept);
 }
 if(title != ""){
   entDat.setValue("title", title);
 }
 entDat.save(entUri + "/data.xml")
}

res;