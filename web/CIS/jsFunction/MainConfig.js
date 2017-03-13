/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//All global variable here

//declare the consultation data
var _data = [];
var notes = "";
var hfc_cd = "04010101";
var doctor_id = "SITI";
var doctor_name = "DR. SITI HALIJAH BINTI ABU BAKAR";
var discipline = "001";
var subdis = "26";

var pmiNo = "";
var episodeDate="";

var PDIFULL;
var HCS;

//declare the consultation row counter
var i = 0;

//declare the Main Consultation Notes
var ConsultationNotes = []

var HCSContent = []

$(document).ready(function(){
    $('.soap-select').click(function () {
        alert("You need to select the patient");
        return false;});
    
});


    function getDateNext(){
        var d = new Date();
        var month = d.getMonth()+1;
        var day = d.getDate();
        if (month < 10){
            month = "0"+ month;
        };
        
        if(day < 10){
            day = "0"+day;
        }
        
    var dates = d.getFullYear() + "-" + month+ "-" +day;
    return dates;
}