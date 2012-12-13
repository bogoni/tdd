var myJSON = '{"resources":{"resourceObjectArray":[{"resourceName":"firstResource"},{"resourceName":"secondResource"},{"resourceName":"thirdResource"}]},"processes":{"processObjectArray":[{"processName":"firstProcess"},{"processName":"secondProcess"},{"processName":"thirdProcess"}]}}';

/* JSON MANIPULATION */

function printInputJSON() {
	$("#inputJSON").contents().remove();
	$("#inputJSON").append(myJSON);
}

function printResultJSON() {
	$("#outputJSON").contents().remove();
	$("#outputJSON").append(encodeResultArray(createResultArray()));
}

function parseJSON() {
	return JSON.parse(myJSON, null);
}

function encodeResultArray(resultArray) {
	return JSON.stringify(resultArray);
}

/* BASIC UI DRAWING */ 

function drawBasicUI() {
	drawResources();
	drawProcesses();
}

function createResourceNameAsLI(resourceName) {
	var li = window.document.createElement("li");
	var span = window.document.createElement("span");
	span.setAttribute("class", "resourceName");
	span.appendChild(window.document.createTextNode(resourceName));
	li.appendChild(span);
	return li;
}

function drawResources() {
	var myObject = parseJSON();
	for (var i = 0; i < myObject.resources.resourceObjectArray.length; i++) {
		$("#resources").append(createResourceNameAsLI(myObject.resources.resourceObjectArray[i].resourceName));
	}
	$("#resources li").draggable({
		appendTo: "body",		
		helper: "clone"
	});	
}

function createProcessesAsUL(processName) {
	var ul = window.document.createElement("ul");
	var span = window.document.createElement("span");
	span.setAttribute("class", "processName");
	var li = window.document.createElement("li");
	span.appendChild(window.document.createTextNode(processName));
	li.appendChild(span);
	ul.appendChild(li);
	return ul;
}

function drawProcesses() {
	var myObject = parseJSON();
	for (var i = 0; i < myObject.processes.processObjectArray.length; i++) {
		$("#divProcesses").append(createProcessesAsUL(myObject.processes.processObjectArray[i].processName));
	}
	$("#divProcesses ul").resizable();
	$("#divProcesses ul").droppable({
		drop: function(event, ui) {
			$(this).append(ui.draggable);
		}
	}).sortable({helper: "original"});
//	$("#divProcesses").sortable().not(".processName");

}

/* RESULTS CREATION */

function createResultArray() {
	var resultArray = new Array();
	
	$("#divResult").contents().remove();
	
	$("#divProcesses > ul").each( function () {
		var resourcesArray = new Array();
		$(this).find(".resourceName").each(function () {
			resourcesArray.push({resourceName: $(this).text()});
		});
		resultArray.push({processName: $(this).find(".processName").text(), resourcesArray: resourcesArray});
	});
	return new Object({resultArray: resultArray});
	
}