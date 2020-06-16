function addformsetform(prefix) {
  var totalFormCounter = document.getElementById(prefix + '-TOTAL_FORMS');
	var totalForms = Number(totalFormCounter.value);
  totalFormCounter.value = totalForms + 1;
  var template = document.getElementById(prefix + '-template');
  var newDiv = template.cloneNode(true);
  var attrs = newDiv.attributes;
  for( a = 0; a < attrs.length; a++ ){
        attrs[a].value=attrs[a].value.replace("template", totalForms);
  }
  controls = ["div", "input", "select", "label"];

  for( n=0; n < controls.length; n++) {
    var children = newDiv.getElementsByTagName( controls[n] );
    for( c=0; c < children.length; c++ ) {
      if( children[c].hasAttributes ) {
        var attrs = children[c].attributes;
        for( a=0; a < attrs.length; a++ ){
          attrs[a].value=attrs[a].value.replace("__prefix__", totalForms);
        }
      }
    }
  }

	var children = newDiv.childNodes;
	while(newDiv.hasChildNodes()) {
    template.parentNode.insertBefore(children[0], template);
  }
}

