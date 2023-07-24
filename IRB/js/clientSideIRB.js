//Javascript functions for use client-side within IRBs and IBCs
//
//	1.0.0 wmalyk (08-02-2009) 
//  Copywrite Consilience International LLC (2009)


function setupForms(model, mode){
    //context is inferred from any values attached to the form
    context = model.__XformSet.getRoot();
    model.__context = context;
    
    context.targetURI = model.getValue("targetURI");
    model.rebuild();
    model.recalculate();
    model.refresh();
    
    return context;
}


function setupFormsDash(model, mode){
    //context is inferred from any values attached to the form
    context = model.__XformSet.getRoot();
    model.__context = context;
    context.targetIRB = context.targetIRB;
    loadInstanceIRB(model, "ins", "/data.xml");
    context.targetIRB = model.getValue("activityURI");
    loadInstanceIRB(model, "ins", "/rules.xml");
    
    //context.targetURI = model.getValue("targetURI");
    model.rebuild();
    model.recalculate();
    model.refresh();
    
    return context;
}

function loadInstanceIRB(model, ins, URI){
    trg = model.__XformSet.getRoot().targetIRB;
    model.setInstanceIdSrc(ins, "/fil" + trg + URI);
}