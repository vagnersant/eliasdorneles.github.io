$(function() {
  function workaroundForFiguresWidth() {
    $('.figure').each(function(){
      var $this = $(this);
      var imgWidth = $this.find('img').css('width')
      if (imgWidth != "0px") {
        $this.css('width', imgWidth);
      }
    });
  }
  $(window).on("load", workaroundForFiguresWidth);
  workaroundForFiguresWidth();
});
