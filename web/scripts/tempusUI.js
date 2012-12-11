var myJSON = '{"resources":{"resourceObjectArray":[{"resourceName":"firstResource"},{"resourceName":"secondResource"},{"resourceName":"thirdResource"}]},"processes":{"processObjectArray":[{"processName":"firstProcess"},{"processName":"secondProcess"},{"processName":"thirdProcess"}]}}';

function printInputJSON() {
	$("#inputJSON").contents().remove();
	$("#inputJSON").append(myJSON);
}

function parseJSON() {
	return JSON.parse(myJSON, null);
}

function drawResources() {
	var myObject = parseJSON();
	for (var i = 0; i < myObject.resources.resourceObjectArray.length; i++) {
		var li = window.document.createElement("li");
		var span = window.document.createElement("span");
		span.setAttribute("class", "resourceName");
		span.appendChild(window.document.createTextNode(myObject.resources.resourceObjectArray[i].resourceName));
		li.appendChild(span);
		$("#resources").append(li);
	}
	$("#resources li").draggable({
		appendTo: "body",		
		helper: "clone"
	});	
}

function drawProcesses() {
	var myObject = parseJSON();
	for (var i = 0; i < myObject.processes.processObjectArray.length; i++) {
		var ul = window.document.createElement("ul");
		var span = window.document.createElement("span");
		span.setAttribute("class", "processName");
		var li = window.document.createElement("li");
		span.appendChild(window.document.createTextNode(myObject.processes.processObjectArray[i].processName));
		li.appendChild(span);
		ul.appendChild(li);
		$("#divProcesses").append(ul);
	}
	$("#divProcesses ul").resizable();
	$("#divProcesses ul").droppable({
		drop: function(event, ui) {
			$(this).append(ui.draggable);
		}
	}).sortable({helper: "original"});
}

function createResultArray() {
	var resultArray = new Array();
	
	$("#divResult").contents().remove();
	
	$("#divProcesses > ul").each( function () {
		var processName = $(this).find(".processName").text();
		var resourcesArray = new Array();
		$(this).find(".resourceName").each(function () {
			resourcesArray.push({resourceName: $(this).text()});
		});
		resultArray.push({processName: processName, resourcesArray: resourcesArray});
	});
	return resultArray;
}

function encodeResultArray(resultArray) {
	return JSON.stringify(resultArray);
}

function printResultJSON() {
	$("#outputJSON").contents().remove();
	$("#outputJSON").append(encodeResultArray(createResultArray()));
}