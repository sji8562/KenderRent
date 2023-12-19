/*
Template Name: Admin Pro Admin
Author: Wrappixel
Email: niravjoshi87@gmail.com
File: js
*/
$(function() {
    "use strict";
    var dtosString = document.getElementById("dtos").value;
    dtosString = dtosString.replace(/MngIndexDTO/g, '');
    dtosString = dtosString.replace(/\(/g, '\{');
    dtosString = dtosString.replace(/\)/g, '\}');
    dtosString = dtosString.replace(/date=(\w+)/g, '"date":"$1"');
    dtosString = dtosString.replace(/count=/g, '"count":');
    dtosString = dtosString.replace(/price=/g, '"price":');
    var dtos = JSON.parse(dtosString);
    console.log(dtos);
    var labels = dtos.map(function(item) {
        return item.date;
    });
    var series = dtos.map(function(item) {
        return item.price;
    });
    console.log(labels);
    console.log(series);
    // ============================================================== 
    // sales ratio
    // ============================================================== 
    var chart = new Chartist.Line('.sales', {
        labels: labels,
        series: series
    }, {
        low: 0,
        high: 48,
        showArea: true,
        fullWidth: true,
        plugins: [
            Chartist.plugins.tooltip()
        ],
        axisY: {
            onlyInteger: true,
            scaleMinSpace: 40,
            offset: 20,
            labelInterpolationFnc: function(value) {
                return (value / 10) + 'k';
            }
        },

    });

    var chart = [chart];

    // ============================================================== 
    // Our Visitor
    // ============================================================== 
    var sparklineLogin = function() {
        $('#earnings').sparkline([6, 10, 9, 11, 9, 10, 12, 10, 9, 11, 9, 10, 12, 10, 9, 11, 9], {
            type: 'bar',
            height: '40',
            barWidth: '4',
            width: '100%',
            resize: true,
            barSpacing: '8',
            barColor: '#137eff'
        });
    };
    var sparkResize;

    $(window).resize(function(e) {
        clearTimeout(sparkResize);
        sparkResize = setTimeout(sparklineLogin, 500);
    });
    sparklineLogin();
});