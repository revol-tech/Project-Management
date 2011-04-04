// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function(){
  // $('#project_deadline').datepicker();
  $('#projects_list').accordion({
    autoHeight: false,
    collapsible: true,
    navigation: true
  });
  $('#tasks_list').accordion({
       autoHeight: false,
       collapsible: true,
       navigation: true
     });
  // $('.progressbar').progressbar({
  //    value: $(this).attr('value')
  //  });
})
