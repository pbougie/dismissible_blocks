(function() {

  NodeList.prototype.dismissible = function(options) {
    for (var i = 0; i < this.length; i++) {
      this[i].dismissible(options);
    }
  }

  HTMLElement.prototype.dismissible = function(options) {
    this.querySelector('[data-dismissible-hide]').addEventListener('click', function(event) {
      event.preventDefault();
      this.dismiss(options);
    });
  }

  HTMLElement.prototype.dismiss = function(options) {
    var block_name = this.getAttribute('data-dismissible-hide');
    var block = document.querySelector('[data-dismissible=' + block_name + ']');
    var csrf = document.querySelector('meta[name=csrf-token]');
    var token = csrf != null ? csrf.getAttribute('content') : null;
    var xhr = new XMLHttpRequest();

    xhr.open('PUT', '/dismissible_blocks.json');
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function() {
      if (xhr.status === 200) {
        if (options !== undefined && options.dismiss !== undefined) {
          return options.dismiss(block);
        } else {
          return block.parentNode.removeChild(block);
        }
      }
    };
    xhr.send(JSON.stringify({
      block: block_name,
      authenticity_token: token
    }));
  }

})();
