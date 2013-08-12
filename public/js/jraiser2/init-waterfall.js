require(['dom/1.0.x/', 'waterfall/1.1.x/'], function($, Waterfall) {
  var waterfall = new Waterfall({
    wrapper: $('#wrapper'),
    template: '<% for (var i = 0; i < data.length; i++) { %>' +
    '<div class="grid">' +
      '<p><img src="<%=data[i].img%>" /></p>' +
      '<p><%-data[i].text%></p>' +
    '</div>' +
    '<% } %>',
    dataURL: '/data.js',
    dataType: 'json',
    rowSpacing: 130,
    fixedImgSize: false,
    prefetch: '20%'
  });

  waterfall.on('load', function() {
    $('#loading').hide();
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