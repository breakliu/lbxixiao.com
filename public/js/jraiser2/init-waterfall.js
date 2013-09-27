require(['dom/1.0.x/', 'waterfall/1.1.x/'], function($, Waterfall) {
  var waterfall = new Waterfall({
    wrapper: $('#wrapper'),
    template: '<% for (var i = 0; i < data.length; i++) { %>' +
    '<div class="grid">' +
      '<p><a class="group1" href="<%=data[i].url%>" title="<%-data[i].text%>"><img src="<%=data[i].img%>" /></a></p>' +
      '<p><%-data[i].text%></p>' +
    '</div>' +
    '<% } %>',
    dataURL: '/c/3/7.json',
    dataType: 'json',
    rowSpacing: 30,
    fixedImgSize: false,
    prefetch: '20%'
  });

  waterfall.on('load', function() {
    $('#loading').hide();
    jQuery(".group1").colorbox({rel:'group1'});
  });


  // 限制同时展示的页数
  var loadCounter = 1;
  waterfall.on('beforeload', function(e) {
    if (loadCounter >= 5) {
      e.preventDefault();
      $('#more').show();
      $('#loading').hide();
    } else {
      loadCounter++;
      $('#more').hide();
      $('#loading').show();
    }
  });

  $('#clear').click(function() {
    loadCounter = 0;
    window.scrollTo(0, 0);
    waterfall.clear();
    waterfall.next();
  });
});