/**
 * Creates an IBC.
 * call format:  arg = {"linkedProject":targetID, "pi", "people":["", ""], "ref":ref}
 * @author wmalyk - Copywrite Consilience International LLC (2009)
 * @date 2009 
 * @version 1.0.1 
 */

var rootPath = files.getPath();
files.runScript(rootPath + "/resources/ideate/js/ideateServerSide.js");
files.runScript(IRBPath + "/js/create.js");

res = new Object();
res.uri = create("IBC", inputs);
res.startPoint = "Complete Protocol";
res = JSON.stringify(res);
res;