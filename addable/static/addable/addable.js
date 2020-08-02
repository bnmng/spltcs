function showAddButton(perm, button_id) {
  if('True'==perm) {
    var buttonAdd = document.getElementById(button_id);
    if( buttonAdd != null ) {
      var style=buttonAdd.getAttribute('style');
      if( '' < style ) {
        buttonAdd.setAttribute('style', style.replace('display:none',''));
      }
    } else {
      var buttonAdds = document.getElementsByClassName("button_addable");
      for( b=0; b<buttonAdds.length; b++ ) {
        var buttonAdd = buttonAdds[b];
        if( buttonAdd.id.match(button_id)) {
          var style=buttonAdd.getAttribute('style');
          if( '' < style ) {
            buttonAdd.setAttribute('style', style.replace('display:none',''));
          }
        }
      }
    }
  }
}

function openModelForm(button) {

  var fieldname = button.getAttribute('data-fieldname');

  var primary = button.previousSibling;
  var loop=0;
  while (primary.tagName != 'SELECT' && loop < 3 ) {
    primary = primary.previousSibling;
    loop ++;
  } 
  var iframe = document.createElement('iframe');
  iframe.id = 'iframe_' + fieldname;
  iframe.name = 'iframe_' + fieldname;
  iframe.setAttribute('data-fieldname', fieldname);
  iframe.setAttribute('data-add_url', button.getAttribute('data-add_url'));
  iframe.setAttribute('data-primary', primary.id );
  iframe.setAttribute('data-secondaries', button.getAttribute('data-secondaries'));
  iframe.src = button.getAttribute('data-add_url');

  parent=button.parentNode;

  parent.insertBefore(iframe, button);

  submit_button = document.createElement('button');
  submit_button.type = "button";
  submit_button.id=('button_submit_' + fieldname);
  submit_button.setAttribute('data-fieldname', fieldname);
  submit_button.setAttribute('data-add_url', button.getAttribute('data-add_url'));
  submit_button.setAttribute('data-primary', primary.id );
  submit_button.setAttribute('data-secondaries', button.getAttribute('data-secondaries'));
  submit_button.innerHTML="Submit";

  submit_button.addEventListener('click', function(e) {
    e.preventDefault();
    submitModelForm(e.target);
  });

  parent.insertBefore(submit_button, button);

  cancel_button = document.createElement('button');
  cancel_button.type = "button";
  cancel_button.id=('button_cancel_' + fieldname);
  cancel_button.setAttribute('data-fieldname', fieldname);
  cancel_button.setAttribute('data-add_url', button.getAttribute('data-add_url'));
  cancel_button.setAttribute('data-primary', primary.id );
  cancel_button.setAttribute('data-secondaries', button.getAttribute('data-secondaries'));
  cancel_button.innerHTML="Cancel";

  cancel_button.addEventListener('click', function(e) {
    e.preventDefault();
    closeModelForm(e.target);
  });

  parent.insertBefore(cancel_button, button);

  button.remove();
}

function closeModelForm(button) {

  var fieldname = button.getAttribute('data-fieldname');

  var iframe = document.getElementById("iframe_" + fieldname);
  iframe.remove();
  var parent = button.parentNode;

  add_button = document.createElement('button');
  add_button.type = "button";
  add_button.id=('button_add_' + button.getAttribute('data-fieldname'));
  add_button.setAttribute('data-fieldname', fieldname);
  add_button.setAttribute('data-add_url', button.getAttribute('data-add_url'));
  add_button.setAttribute('data-primary', button.getAttribute('data-primary'));
  add_button.setAttribute('data-secondaries', button.getAttribute('data-secondaries'));
  add_button.innerHTML="Add";

  add_button.addEventListener('click', function(e) {
    e.preventDefault();
    openModelForm(e.target);
  });

  parent.insertBefore(add_button, button);
  
  submit_button = document.getElementById('button_submit_' + fieldname);
  submit_button.remove();

  button.remove();
}

function submitModelForm(button) {
  var fieldname = button.getAttribute('data-fieldname');
  var iframe = document.getElementById('iframe_' + fieldname);
	iframe.contentDocument.getElementById('form').submit();
}

function updateSelects( iframe, optionValue, optionInner ) {
  var fieldname = iframe.getAttribute('data-fieldname');
  option = document.createElement('option');
  option.setAttribute('value', optionValue);
  option.innerHTML = optionInner;

  var selectNames = iframe.getAttribute('data-secondaries').split(',');
  for( s=0; s < selectNames.length; s++ ) {
        var selectName = selectNames[s].trim();
        if( '' < selectName ) {
            var select = document.getElementById(selectNames[s]);
            if(select != null) {
                select.appendChild(option);
            }
        }
  }
  optionClone=option.cloneNode(true);
  optionClone.setAttribute('selected', 'selected');
  var primary = document.getElementById(iframe.getAttribute('data-primary'));
  primary.appendChild(optionClone);

  add_button = document.createElement('button');
  add_button.type = "button";
  add_button.id=('button_add_' + iframe.getAttribute('data-fieldname'));
  add_button.setAttribute('data-add_url', iframe.getAttribute('data-add_url'));
  add_button.setAttribute('data-fieldname', iframe.getAttribute('data-fieldname'));
  add_button.setAttribute('data-primary', iframe.getAttribute('data-primary'));
  add_button.setAttribute('data-secondaries', iframe.getAttribute('data-secondaries'));
  add_button.innerHTML="Add";

  add_button.addEventListener('click', function(e) {
    e.preventDefault();
    openModelForm(e.target);
  });

	parent = iframe.parentNode;

  parent.insertBefore(add_button, iframe);
	
	submit_button = document.getElementById('button_submit_' + fieldname);
	submit_button.remove();
	cancel_button = document.getElementById('button_cancel_' + fieldname);
	cancel_button.remove();
	iframe.remove();
}

document.addEventListener('DOMContentLoaded', function(){
  var addButtons = document.getElementsByTagName('button');
  for( b=0; b < addButtons.length; b++ ) {
    if(addButtons[b].getAttribute('id') ) {
      if('button_add' == addButtons[b].getAttribute('id').substr(0,10) ) {
        var button = addButtons[b];
        button.addEventListener('click', function(e) {
          e.preventDefault();
          openModelForm(e.target);
        });
      }
    }
  }
});
