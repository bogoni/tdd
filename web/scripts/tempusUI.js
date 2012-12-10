var myJSON = '{"resources":{"resourceObjectArray":[{"resourceName":"firstResource"},{"resourceName":"secondResource"},{"resourceName":"thirdResource"}]},"processes":{"processObjectArray":[{"processName":"firstProcess"},{"processName":"secondProcess"},{"processName":"thirdProcess"}]}}';

function printJSON() {
	window.document.getElementById("JSONOutput").appendChild(window.document.createTextNode(myJSON));
}

function parseJSON() {
	var myObject = JSON.parse(myJSON, null);
	return myObject;
}

function drawResources() {
	var myObject = parseJSON();
	var resourceArray = myObject.resources.resourceObjectArray;
	var ulResource = window.document.getElementById("resources");
	for (var i = 0; i < resourceArray.length; i++) {
		var li = window.document.createElement("li");
		li.appendChild(window.document.createTextNode(resourceArray[i].resourceName));
		ulResource.appendChild(li);
	}
	$("#resources li").draggable({
		appendTo: "body",
		helper: "clone"
	});	
}

function drawProcesses() {
	var myObject = parseJSON();
	var processArray = myObject.processes.processObjectArray;
	var divProcess = window.document.getElementById("divProcesses");
	for (var i = 0; i < processArray.length; i++) {
		var ul = window.document.createElement("ul");
		var span = window.document.createElement("span");
		span.setAttribute("class", "processName");
		span.appendChild(window.document.createTextNode(processArray[i].processName));
		ul.appendChild(span);
		divProcess.appendChild(ul);
	}
	$("#divProcesses ul").droppable({
		drop: function(event, ui) {
			$("<li></li>").text(ui.draggable.text()).appendTo(this);
		}
	}).sortable();
	$("#divProcesses ul").resizable();
}