(function() {
  (function($) {

    $.fn.dismissible = function(options) {
      return this.each(function() {
        var _this = $(this);
        $('[data-dismissible-hide]', this).click(function(event) {
          event.preventDefault();
          return _this.dismiss(options);
        })
      });
    };

    return $.fn.dismiss = function(options) {
      return $.ajax({
        type: 'POST',
        url: '/dismissible_blocks.json',
        dataType: 'json',
        contentType: 'application/json',
        data: JSON.stringify({
          block: $(this).attr('data-dismissible'),
          authenticity_token: $('meta[name=csrf-token]').attr('content')
        }),
        success: (function(_this) {
          return function() {
            if ((options != null) && options.dismiss !== void 0) {
              return options.dismiss(_this);
            } else {
              return $(_this).remove();
            }
          }
        })(this)
      });
    };

  })(jQuery);
}).call(this);
