function markSympSelects(pattern){
  var allSelects = document.getElementsByTagName("select");
  var sympSelects = []
  for (s=0; s<allSelects.length; s++) {
    if( allSelects[s].id.match(pattern)) {
      sympSelects.push(allSelects[s]);
    }
  }
  for (s=0; s< sympSelects.length; s++) {
    options = sympSelects[s].options;
    for( p=0; p < options.length; p++) {
      options[p].classList.remove("sympTaken");
    }
  }
  for (s=0; s< sympSelects.length; s++) {
    if(sympSelects[s].value > '') {
      for ( ss=0; ss < sympSelects.length; ss++ ){
        options = sympSelects[ss].options;
        for (p=0; p < options.length; p++ ){
          if ( options[p].value==sympSelects[s].value ){
            options[p].classList.add("sympTaken");
            sympSelects[ss].append(options[p]) /*moves to bottom*/
          }
        }
      }
    }
  }
}
function sympSelectInit(parent, pattern ) {
  markSympSelects(pattern);
  var allSelects = document.getElementsByTagName("select");
  var sympSelects = []
  for (s=0; s<allSelects.length; s++) {
    if( allSelects[s].id.match(pattern)) {
      sympSelects.push(allSelects[s]);
    }
  }
	parent.addEventListener('change', function(e) {
		e.preventDefault();
		if(e.target.id.match(pattern)){
			markSympSelects(pattern);
		}
	});
}

