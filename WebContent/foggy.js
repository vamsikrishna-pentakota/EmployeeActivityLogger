// Foggy, v1.1.1
//
// Description: jQuery plugin for blurring page elements
// Homepage:    http://nbartlomiej.github.com/foggy
// Author:      nbartlomiej@gmail.com

(function(e) {
	e.fn.foggy = function(t) {
		var n = {
			opacity : .8,
			blurRadius : 2,
			quality : 16,
			cssFilterSupport : true
		};
		var r = {
			opacity : 1,
			blurRadius : 0
		};
		var i;
		if (t == false) {
			i = e.extend(n, r)
		} else {
			i = e.extend(n, t)
		}
		var s = function(e, t, n, r) {
			this.content = e;
			this.position = t;
			this.offset = n;
			this.opacity = r
		};
		s.prototype.render = function(t) {
			e("<div/>", {
				html : this.content,
				"class" : "foggy-pass-" + this.position
			}).css({
				position : this.position,
				opacity : this.opacity,
				top : this.offset[0],
				left : this.offset[1]
			}).appendTo(t)
		};
		var o = function(e) {
			this.radius = e
		};
		o.prototype.includes = function(e, t) {
			if (Math.pow(e, 2) + Math.pow(t, 2) <= Math.pow(this.radius, 2)) {
				return true
			} else {
				return false
			}
		};
		o.prototype.points = function() {
			var e = [];
			for (var t = -this.radius; t <= this.radius; t++) {
				for (var n = -this.radius; n <= this.radius; n++) {
					if (this.includes(t, n)) {
						e.push([ t, n ])
					}
				}
			}
			return e
		};
		var u = function(e, t) {
			this.element = e;
			this.settings = t
		};
		u.prototype.calculateOffsets = function(t, n) {
			var r = e.grep((new o(t)).points(), function(e) {
				return e[0] != 0 || e[1] != 0
			});
			var i;
			if (r.length <= n) {
				i = r
			} else {
				var s = r.length - n;
				var u = [];
				for (var a = 0; a < s; a++) {
					u.push(Math.round(a * (r.length / s)))
				}
				i = e.grep(r, function(t, n) {
					if (e.inArray(n, u) >= 0) {
						return false
					} else {
						return true
					}
				})
			}
			return i
		};
		u.prototype.getContent = function() {
			var t = e(this.element).find(".foggy-pass-relative")[0];
			if (t) {
				return e(t).html()
			} else {
				return e(this.element).html()
			}
		};
		u.prototype.render = function() {
			var t = this.getContent();
			e(this.element).empty();
			var n = e("<div/>").css({
				position : "relative"
			});
			var r = this.calculateOffsets(this.settings.blurRadius * 2,
					this.settings.quality);
			var i = this.settings.opacity * 1.2 / (r.length + 1);
			(new s(t, "relative", [ 0, 0 ], i)).render(n);
			e(r).each(function(e, r) {
				(new s(t, "absolute", r, i)).render(n)
			});
			n.appendTo(this.element)
		};
		var a = function(e, t) {
			this.element = e;
			this.settings = t
		};
		a.prototype.render = function() {
			var t = ("" + i.opacity).slice(2, 4);
			var n = this.settings.blurRadius;
			e(this.element).css({
				"-webkit-filter" : "blur(" + n + "px)",
				opacity : i.opacity
			})
		};
		return this.each(function(e, t) {
			if (i.cssFilterSupport && "-webkit-filter" in document.body.style) {
				(new a(t, i)).render()
			} else {
				(new u(t, i)).render()
			}
		})
	}
})(jQuery)
