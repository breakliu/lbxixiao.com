# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("#page_content").infinitescroll
    navSelector: ".pagination"
    nextSelector: ".pagination a[rel=next]"
    itemSelector: ".myrow"
    loadingText: "我正在努力载入中..."
    donetext: '已至末端'