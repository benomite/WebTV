var dashMenu = document.getElementById("dash-menu");

if (dashMenu) {
  // Add class to body to add margin to top
  document.getElementsByTagName("body")[0].className += " dash-menu";

  // See: http://www.htmldog.com/articles/suckerfish/dropdowns/
  setHover = function() {
    var els = dashMenu.getElementsByTagName("li");
    for (var i = 0; i < els.length; i++) {
      els[i].onmouseover = function() {
        this.className += " hover";
      }
      els[i].onmouseout = function() {
        var el = this;
        // Add hover delay if submenu present
        if (this.getElementsByTagName("ul").length) {
          setTimeout(function(){ removeHoverClass(el); }, 400);
        }
        else {
          removeHoverClass(el);
        }
      }
    }
  }

  // Strip the "hover" class from an element
  removeHoverClass = function(el) {
    el.className = el.className.replace(new RegExp(" hover\\b"), "");
  }

  // Cross-browser event listener
  listen = function(ev, el, fn) {
    if (el.addEventListener) {
      el.addEventListener(ev, fn, false);
    }
    else if (el.attachEvent) {
      var r = el.attachEvent("on"+ ev, fn);
      return r;
    }
  }

  listen("load", window, setHover);
}
