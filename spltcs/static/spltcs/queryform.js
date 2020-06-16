    var openSearchDiv = document.createElement('div');
    openSearchDiv.id = 'div_open_query';
    openSearchDiv.innerHTML=('<p><a href="#">Open Search Form</a></p>');
    var searchDiv = document.getElementById('div_query');
    searchDiv.parentNode.insertBefore(openSearchDiv, searchDiv);
    searchDiv.style.display="none";
    openSearchDiv.addEventListener('click', function(e) {
        e.preventDefault();
        openSearchForm();
    });
    function openSearchForm() {
        var openSearchDiv = document.getElementById('div_open_query');
        var searchDiv = document.getElementById('div_query');
        if('none'==searchDiv.style.display) {
            searchDiv.style.display="block";
            openSearchDiv.innerHTML=('<p><a href="#">Hide Search Form</a></p>');
        } else {
            searchDiv.style.display="none";
            openSearchDiv.innerHTML=('<p><a href="#">Open Search Form</a></p>');
        }

    }
    function clearAllFilterUses() {
        filter_use_checkboxes = document.getElementsByClassName("filter_use");
        for ( f = 0; f < filter_use_checkboxes.length; f++ ) {
            filter_use_checkboxes[f].checked = false;
        }
        document.getElementById("chk_filter_use_clear").checked=false;
    }
    document.getElementById("chk_filter_use_clear").addEventListener("click", function(e) {
        e.preventDefault;
        clearAllFilterUses();
    });
    document.getElementById("chk_filter_use_clear").addEventListener("click", function(e) {
        e.preventDefault;
        clearAllFilterUses();
    });
    function checkFilterUse( filter_use_checkbox ) {
        filter_use_checkbox.checked="checked";
    }
    filter_values = document.getElementsByClassName("filter_value");

    for ( f = 0; f < filter_values.length; f++ ) {
        filter_values[f].addEventListener("keydown", function(e) {
            var targetid = e.target.id;
            var idbase = targetid.substring(0, targetid.length - 5);
            var useboxid = idbase + "use";
            document.getElementById(useboxid).checked="checked";
        });
        filter_values[f].addEventListener("change", function(e) {
            var targetid = e.target.id;
            var idbase = targetid.substring(0, targetid.length - 5);
            var useboxid = idbase + "use";
            document.getElementById(useboxid).checked="checked";
        });
    }
        
