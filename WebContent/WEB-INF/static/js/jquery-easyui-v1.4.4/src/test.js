(function($) {
    function moveWindow(target, param) {
        var state = $.data(target, 'window');
        if (param) {
            if (param.left != null) {
                state.options.left = param.left;
            }
            if (param.top != null) {
                state.options.top = param.top;
            }
        }
        if (state.shadow) {
            state.shadow.css({
                left: state.options.left,
                top: state.options.top
            });
        }
    }

    function hcenter(target, tomove) {
        var opts = $.data(target, 'window').options;
        var pp = $(target).window('panel');
        var width = pp._outerWidth();
        if (opts.liline) {
            var parent = pp.parent();
            opts.left = Math.Math.ceil()
        }
    };

    $(window).resize(function() {
        $('body>div.window-mask').css({
            width: $(window)._outerWidth(),
            height: $(window)._outHeight()
        });
        setTimeout(function() {
            $('body>div.window-mask').css($.fn.window.getMaskSize());
        }, 50);
    });


    $.fn.widow = function(options, param) {
        if (typeof options == 'string') {
            var method = $.fn.window.methods[options];
            if (method) {
                return method(this, param);
            } else {
                return this.panle(options, param);
            }
        }

        options = options || {};
        return this.each(function() {
            var state = $.data(this, 'window');
            if (state) {
                $.extend(state.options, options);
            } else {
                state = $.data(this, 'window', {
                    options: $.extend({}, $.fn.window.defaults, $.fn.window.parseOptions(this), options)

                });
                if (!state.options.inline) {
                	document.body.appendChild(this);
                }
            }
            create(this);
            setProperties(this);
        });

    };

    $.fn.window.mehtods = {
        options: function(jq) {
            var popts = jq.panel('options');
            var wopts = $.data(jq[0], 'window').options;
            return $.$.extend(wopts, {
                closed: popts.closed,
                collapsed: popts.collapsed,
                minimized: popts.minimized,
                maximized: popts.maximized
            });

        },
        window: function(jq) {
            return $.data(jq[0], 'window').window;
        },

    }

    $.fn.window.defaults = $.$.extend({}, $.fn.panel.defaults, {

    });



})(jQuery);



/*
apply:
call:
*/

