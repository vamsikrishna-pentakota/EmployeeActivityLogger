;(function(factory){

  if (typeof define === 'function' && define.amd) {
      define(['jquery'], factory);
  } else if (typeof exports !== 'undefined') {
      module.exports = factory(require('jquery'));
  } else {
      factory(jQuery);
  }

})(function($){

  var BannerSlide = (function(element, settings){

    var instanceUid = 0;

    /*
     * constructor function for BannerSlide
     */

    function settingAll(element, settings){
      this.defaults = {
        slideDuration: '4000',
        speed: 700,
        arrowRight: '.arrow-right',
        arrowLeft: '.arrow-left'
      };

      // create a new property to hold default settings
      // if user not declare some settings, default settings will use
      // and more function can be created using parameter here
      this.settings = $.extend({},this,this.defaults,settings);

	    // default variables operates
      this.initials = {
        currSlide : 0,
        $currSlide: null,
        totalSlides : false,
        csstransitions: false
      };

	    // extend this.initials as direct properties of BannerSlider
      $.extend(this,this.initials);

      this.$el = $(element);

	    // ensure that the value of 'this' always references BannerSlider
      this.manageSlide = $.proxy(this.manageSlide,this);

      this.init();

		 	// provides each carousel with a unique ID
      this.instanceUid = instanceUid++;
    }

    return settingAll;

  })();

	/**
	 * function init once
	 */

  BannerSlide.prototype.init = function(){
    // to see if css3 transitions animate are available
    this.transitionsTest();

    this.$el.addClass('BannerSlide-carousel');
	  // create an indicator dot for every slide
    this.buildIndicator();
	  // bind events like click next/prev arrows and indicator dots
    this.eventsBind();
	  // active first slide and indicator
    this.activeFirst();
	  // Start the timer
    this.initTimer();
  };

	/**
	 * modernizr v2.8.3 testing if css3 transitions animate are available
	 */

	BannerSlide.prototype.transitionsTest = function(){
		var elem = document.createElement('modernizr'),
				props = ["transition","WebkitTransition","MozTransition","OTransition","msTransition"];

		for ( var i in props ) {
			var prop = props[i];
			var result = elem.style[prop] !== undefined ? prop : false;
			if (result){
				this.csstransitions = result;
				break;
			}
		}
	};

	/**
	 * add css3 duration for animate
	 */

	BannerSlide.prototype.durationAdd = function(){
		var _this = this;
		this.$el.find('.slide').each(function(){
			this.style[_this.csstransitions+'Duration'] = _this.settings.speed+'ms';
		});
	}

	/**
	 * remove css3 duration for animate
	 */

	BannerSlide.prototype.removeCSSDuration = function(){
		var _this = this;
		this.$el.find('.slide').each(function(){
			this.style[_this.csstransitions+'Duration'] = '';
		});
	}

	/**
	 * creates indicators
	 */

	BannerSlide.prototype.buildIndicator = function(){
		var $indicators = this.$el.append('<ul class="indicators" >').find('.indicators');
		this.totalSlides = this.$el.find('.slide').length;
		for(var i = 0; i < this.totalSlides; i++) $indicators.append('<li data-index='+i+'>');
	};

	/**
	 * active the first slide and the first indicator
	 */

	BannerSlide.prototype.activeFirst = function(){
		this.$currSlide = this.$el.find('.slide').eq(0);
		this.$el.find('.indicators li').eq(0).addClass('active');
	};

	/**
	 * init timer
	 */

	BannerSlide.prototype.initTimer = function(){
		this.timer = setInterval(this.manageSlide, this.settings.slideDuration);
	};

	/**
	 * start timer
	 */

	BannerSlide.prototype.startTimer = function(){
		this.initTimer();
		this.throttle = false;
	};

	/**
	 * reset timer
	 */

	BannerSlide.prototype.clearTimer = function(){
		if (this.timer)
			clearInterval(this.timer);
	};

	/**
	 * MAIN LOGIC HANDLER
	 * Triggers a set of subfunctions to carry out the animation
	 * @params	object	event
	 * @returns void
	 *
	 */
	BannerSlide.prototype.manageSlide = function(e){
		//Ensure that animations are triggered one at a time
		if (this.throttle)
			return;
		this.throttle = true;

		//stop timer when animate is getting carried out
		this.clearTimer();

		//animation direction (left or right)
		var direction = this._direction(e);

		//select the next slide function
		var animate = this._next(e,direction);
		if (!animate)
			return;

		var $nextSlide = this.$el.find('.slide').eq(this.currSlide).addClass(direction + ' active');

    if (!this.csstransitions){
			this._jsAnimation($nextSlide,direction);
		} else {
			this._cssAnimation($nextSlide,direction);
		}
	};

	/**
	 * deal with the direction
	 */

	BannerSlide.prototype._direction = function(e){
		var direction;

		//default to forward movement => right
		if (typeof e !== 'undefined'){
			direction = (typeof e.data === 'undefined' ? 'right' : e.data.direction);
		} else {
			direction = 'right';
		}
		return direction;
	};

	/**
	 * updates the next slide element
	 */

	BannerSlide.prototype._next = function(e,direction){

	  //to make sure click indicator or not,store the data-index value if click
		var index = (typeof e !== 'undefined' ? $(e.currentTarget).data('index') : undefined);

		//determining the next slide
		switch(true){
			//click indicator situation
      case( typeof index !== 'undefined'):
	      // when click the same indicator
				if (this.currSlide == index){
					this.startTimer();
					return false;
				}
				this.currSlide = index;
			break;
			case(direction == 'right' && this.currSlide < (this.totalSlides - 1)):
				this.currSlide++;
			break;
			case(direction == 'right'):
				this.currSlide = 0;
			break;
			case(direction == 'left' && this.currSlide === 0):
				this.currSlide = (this.totalSlides - 1);
			break;
			case(direction == 'left'):
				this.currSlide--;
			break;
		}
		return true;
	};

	/**
	 * transition with css3 animation
	 */

	BannerSlide.prototype._cssAnimation = function($nextSlide,direction){
    //init css transitions
		setTimeout(function(){
			this.$el.addClass('transition');
			this.durationAdd();
			this.$currSlide.addClass('shift-'+direction);
			this._updateIndicators();
		}.bind(this),100);

		//clear and reset after animate
		setTimeout(function(){
			this.$el.removeClass('transition');
			this.removeCSSDuration();
			this.$currSlide.removeClass('active shift-left shift-right');
			this.$currSlide = $nextSlide.removeClass(direction);
			this.startTimer();
		}.bind(this),100 + this.settings.speed);
	};

	/**
	 * transition with jquery animation
	 */

	BannerSlide.prototype._jsAnimation = function($nextSlide,direction){
		//use this reference inside animate functions
		var _this = this;

	  // set left 0 => auto
		if(direction == 'right')
			_this.$currSlide.addClass('js-reset-left');

    var animation = {};
		animation[direction] = '0';

		var animationPrev = {};
		animationPrev[direction] = '100%';

		//animate current slide 0 => 100%
		this.$currSlide.animate(animationPrev,this.settings.speed);
		_this._updateIndicators();

		//animation next slide 100% => 0
		$nextSlide.animate(animation,this.settings.speed,'swing',function(){
			//clear and reset current element animation after
			_this.$currSlide.removeClass('active js-reset-left').attr('style','');
			//clear and reset next element animation and set the new current element after
			_this.$currSlide = $nextSlide.removeClass(direction).attr('style','');
			_this.startTimer();
		});
	};

  /**
	 * ensures the slide indicators are pointing to the currently active slide
	 */

	BannerSlide.prototype._updateIndicators = function(){
		this.$el.find('.indicators li').removeClass('active').eq(this.currSlide).addClass('active');
	};

	/**
   * binding event handlers to events
   */

	BannerSlide.prototype.eventsBind = function(){
		$('body')
			.on('click',this.settings.arrowRight,{direction:'right'},this.manageSlide)
			.on('click',this.settings.arrowLeft,{direction:'left'},this.manageSlide)
			.on('click','.indicators li',this.manageSlide);
	};

	/**
	 * init once for each dom object passed to jquery
	 */

	$.fn.BannerSlide = function(options){
    return this.each(function(index,el){
      el.BannerSlide = new BannerSlide(el,options);
    });
  };
});