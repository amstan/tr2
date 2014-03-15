/*
 * Scripts for TR2 DeltaBot Interface
 */

var updateMode = UpdateMode.ValueChange;

$(function() {
    console.log('TR2 DeltaBot Interface');
    
    console.log('Binding events...');
    $('#updateModeForm').submit(function () {
        alert('setting update mode');
    });

    $('#interpolationModeForm').submit(function () {
        alert('setting interpolation');
    });

});
