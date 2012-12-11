var myJSON = '{"resources":{"resourceObjectArray":[{"resourceName":"firstResource"},{"resourceName":"secondResource"},{"resourceName":"thirdResource"}]},"processes":{"processObjectArray":[{"processName":"firstProcess"},{"processName":"secondProcess"},{"processName":"thirdProcess"}]}}';

function printJSON() {
	$("#JSONOutput").append(myJSON);
}

function parseJSON() {
	var myObject = JSON.parse(myJSON, null);
	return myObject;
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
			//$("<li></li>").text(ui.draggable.text()).appendTo(this);
		}
	}).sortable({helper: "original"});
}

function printResultArray() {
	var resultArray = new Array();
	
	$("#divResult").find("#result > li").remove();
	
	$("#divProcesses > ul").each( function (index, Element) {
		var tempArray = new Array();
		var processName = $(this).find(".processName").text();
		$(this).find(".resourceName").each(function () {
			tempArray.push($(this).text());
		});
		resultArray.push({processName: processName, resourcesArray: tempArray});
	});
	for (var i = 0; i < resultArray.length; i++) {
		var liProcess = window.document.createElement("li");
		liProcess.appendChild(window.document.createTextNode(resultArray[i].processName));
		$("#result").append(liProcess);
		var liResources = window.document.createElement("li");
		var ulResources = window.document.createElement("ul");
		for (var j = 0; j < resultArray[i].resourcesArray.length; j++) {
			var liResource = window.document.createElement("li");
			liResource.appendChild(window.document.createTextNode(resultArray[i].resourcesArray[j]));
			ulResources.appendChild(liResource);
		}
		if (ulResources.childNodes.length > 0 ) {
			liResources.appendChild(ulResources);
		}
		if (liResources.childNodes.length > 0) {
			$("#result").append(liResources);
		}
	}
}