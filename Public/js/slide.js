$(function(){
	var wrap = $('.banner-slide');
	var contents = wrap.children('.slide-con');
	var btns = wrap.children('.banner-btn').children('li');
	var disX = wrap.children('.banner-btn').width();
	wrap.children('.banner-btn').css('margin-left',-disX/2+'px')
	var timer;
	var index=0;
	contents.eq(0).css('display','block');
	btns.eq(0).addClass('on');
	autoslide()
	btns.each(function(i){
		$(this).click(function(){
			slide(i);
			index=i;
		})
	})
	function slide(i) {
		contents.css('display','none');
		btns.removeClass('on');
		contents.eq(i).fadeIn();
		btns.eq(i).addClass('on');
	}
	function autoslide(){
		timer=setInterval(function(){
			index++
			if(index==btns.size())
			{
				index=0;
			}
			slide(index);
		},8000);
	}
	btns.mouseover(function(){
		clearInterval(timer);
	})
	btns.mouseout(function(){
		autoslide();
	})
})