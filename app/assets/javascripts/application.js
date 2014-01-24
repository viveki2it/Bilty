// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui-1.10.3.custom.min
//= require autocomplete-rails
//= require highcharts
//= require highcharts/highcharts-more 
//= require highcharts/themes/gray
//= require twitter/bootstrap
//= require turbolinks
//= require bootstrap-datepicker
//= require_tree .

function Showprice() {
    if ($('#invoice_insurance_yes').is(':checked')) {
        $('#ins_price').show();
    } else {
        $('#ins_price').hide();
    }
}

function PrintPage() {
    window.print();
    return false;
  }
  
  function ChangeLrType(val) {
    if (val === "bil") {
      $("#bill_party").show();
    } else {
      $("#bill_party").hide();
    }
  }
  
  function GetBranch(val) {
    $.ajax({
      url: "/lr_entries/" + val + "/change_branch_name/",
      method: "GET",
      dataType: "script",
      success: function(data){
        
      }
    })
  }