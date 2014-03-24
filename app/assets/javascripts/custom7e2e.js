(function($) {
	"use strict";	

   /*SUPERFISH*/

   $('.theme-menu').find('li:has(ul)').addClass('has-menu');
   $('ul.sf-menu').superfish();


   /*FADE TIMEOUT*/

   setTimeout(function(){
      $(".wpcf7-response-output").fadeOut("slow", function () {
         $(".wpcf7-response-output").remove();
      });
   }, 5000);


   /*SCROLLTOP*/

   $(function () {
      $(window).scroll(function () {
         if ($(this).scrollTop() > 100) {
            $('#toTop').fadeIn();
         } else {
            $('#toTop').fadeOut();
         }
      });

      $("#toTop").click(function(){
         $("html, body").animate({ scrollTop: 0 }, 600);
            return false;
      });  
   });


   /*FADE TIMEOUT*/

   setTimeout(function(){
      $(".agent-form .sent").fadeOut("slow", function () {
         $(".agent-form .sent").remove();
      });
   }, 5000);


   /*FLEXSLIDER NAV HOVER*/

   $(".properties-flexslider ul.flex-direction-nav").hide();
   $(".properties-flexslider").hover(function () { $(" ul.flex-direction-nav").fadeToggle(); });
   $(".blog-flexslider ul.flex-direction-nav").hide();
   $(".blog-flexslider").hover(function () { $(" ul.flex-direction-nav").fadeToggle(); });  
   $(".home-flexslider ul.flex-direction-nav").hide();
   $(".home-flexslider").hover(function () { $(" ul.flex-direction-nav").fadeToggle(); });    


   /*CUSTOM SELECTBOX*/

   $('.advance-search-block select').selectBox({ mobile: true });
    

   /*SEARCH*/

   new UISearch( document.getElementById( 'sb-search' ) );


   /*TOP SLIDE*/

   $('a.slide-toggle').click(function() {
      $('.sliding-bar').slideToggle('fast', function() {
         $('a.slide-toggle').toggleClass('open', $(this).is(':visible'));
      });
      return false;
   });



})(jQuery);