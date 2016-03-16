(function($) {
	$.fn.textSlider = function(a) {
		a = $.extend({
			direc: 1,
			fri: 0,
			fris: 0,
			speed: "normal",
			lines: 1,
			qnum: 1,
			offset: 1000
		}, a);
		return this.each(function() {
			$.fn.textSlider.scllor($(this), a)
		})
	};
	$.fn.textSlider.scllor = function(a, b) {
		var c = $(".cxjli", a);
		var d = $(".cxjinfo", a);
		var e = $(".cxjitem", a);
//		if (window.location.host == "localhost" || window.location.host == "hyu1724060001.my3w.com" || window.location.host == "www.hzltyp.com" || window.location.host == "hzltyp.com") {} else {
//			e.removeClass("cxjitem")
//		};
		var f = e.width() * -1;
		var g = e.height() * -1;
		var i = -b.lines;
		var h = null;
		var j = $(e).size();

		function autoroll() {
			i += b.lines;
			if (i > j - b.qnum - b.fris) {
				i = -b.fris
			}
			slide(i);
			h = window.setTimeout(autoroll, b.offset)
		};

		function slide(i) {
			if (b.direc == 1) {
				d.css({
					"width": j * -f
				});
				d.animate({
					left: f * i - b.fri
				}, b.speed)
			}
			if (b.direc == 5) {
				if (j % 2 == 1) {
					j = j + 1
				};
				d.css({
					"width": (j * -f) / 2
				});
				d.animate({
					left: f * i / 2
				}, b.speed)
			}
			if (b.direc == 2) {
				d.animate({
					top: g * i
				}, b.speed)
			}
			if (b.direc == 3) {
				e.hide();
				e.eq(i).show()
			}
			if (b.direc == 4) {
				e.hide();
				e.eq(i).fadeIn().show()
			}
			c.eq(i / b.lines).addClass('visited').siblings().removeClass('visited')
		};
		c.hover(function() {
			if (h) {
				clearTimeout(h);
				i = $(this).prevAll().length * b.lines;
				slide(i)
			}
		}, function() {
			h = window.setTimeout(autoroll, b.offset);
			this.blur();
			return false
		});
		$('.up', a).click(function() {
			i += b.lines;
			if (i > j - b.qnum - b.fris) {
				i = -b.fris
			}
			slide(i)
		});
		$('.down', a).click(function() {
			i -= b.lines;
			if (i < -b.fris) {
				i = j - b.qnum - b.fris
			}
			slide(i)
		});
		autoroll();
	}
})(jQuery);