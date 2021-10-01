<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <script>
        window.onload = function () {

            var dps = []; // dataPoints
            var chart = new CanvasJS.Chart("chartContainer", {
                title :{
                    text: ""
                },
                axisY: {
                    includeZero: false
                },
                data: [{
                    type: "line",
                    dataPoints: dps
                }]
            });

            var xVal = 0;
            var yVal = 100;
            var updateInterval = 1000;
            var dataLength = 20; // number of dataPoints visible at any point

            var updateChart = function (count) {

                count = count || 1;

                for (var j = 0; j < count; j++) {
                    yVal = yVal +  Math.round(5 + Math.random() *(-5-5));
                    dps.push({
                        x: xVal,
                        y: yVal
                    });
                    xVal++;
                }

                if (dps.length > dataLength) {
                    dps.shift();
                }

                chart.render();
            };

            updateChart(dataLength);
            setInterval(function(){updateChart()}, updateInterval);

           // le graphe de benefice
            var chart0 = new CanvasJS.Chart("chartContainer4", {
                animationEnabled: true,
                title:{
                    text: "Benefice Du Site Année 2017 "
                },
                axisX:{
                    valueFormatString: "MMM",
                    crosshair: {
                        enabled: true,
                        snapToDataPoint: true
                    }
                },
                axisY: {
                    title: " Le Benefice(en DZD)",
                    includeZero: false,
                    valueFormatString: "DZD ##0.00",
                    crosshair: {
                        enabled: true,
                        snapToDataPoint: true,
                        labelFormatter: function(e) {
                            return "DZD" + CanvasJS.formatNumber(e.value, "##0.00");
                        }
                    }
                },
                data: [{
                    type: "area",
                    xValueFormatString: "MMM",
                    yValueFormatString: "DZD ##0.00",
                    dataPoints: [
                        { x: new Date(2018, 01, 01), y: 20.727997 },
                        { x: new Date(2018, 02, 01), y: 62.459999 },
                        { x: new Date(2018, 03, 01), y: 76.011002 },
                        { x: new Date(2018, 04, 01), y: 75.751999 },
                        { x: new Date(2018, 05, 01), y: 63.500000 },
                        { x: new Date(2018, 06, 01), y: 60.500000 },
                        { x: new Date(2018, 07, 01), y: 58.500000 },
                        { x: new Date(2018, 08, 01), y: 77.500000 },
                        { x: new Date(2018, 09, 01), y: 80.500000 },
                        { x: new Date(2018, 10, 01), y: 75.500000 },
                        { x: new Date(2018, 11, 01), y: 70.500000 },
                        { x: new Date(2018, 12, 01), y: 70.500000 }

                    ]
                }]
            });
            chart0.render();

            // le graphe des reservation
            var chart1 = new CanvasJS.Chart("chartContainer3", {
                exportEnabled: true,
                animationEnabled: true,
                title:{
                    text: "Etat Des Reservation"
                },
                legend:{
                    cursor: "pointer",
                    itemclick: explodePie
                },
                data: [{
                    type: "pie",
                    showInLegend: true,
                    toolTipContent: "{name}: <strong>{y}%</strong>",
                    indexLabel: "{name} - {y}%",
                    dataPoints: [
                        { y: ${res_cour}, name: "En cours", exploded: true },
                        { y: ${res_valider}, name: "Valider",exploded: true },
                        { y: ${res_annule}, name: "Annuler" },
                        { y: 3, name: "Autres" },
                    ]
                }]
            });
            chart1.render();

            // le graphe des compte
            var chart2 = new CanvasJS.Chart("chartContainer2", {
                exportFileName: "Doughnut Chart",
                exportEnabled: true,
                animationEnabled: true,
                title:{
                    text: "Etat Des Comptes "
                },
                legend:{
                    cursor: "pointer",
                    itemclick: explodePie
                },
                data: [{
                    type: "doughnut",
                    innerRadius: 90,
                    showInLegend: true,
                    toolTipContent: "<b>{name}</b>: ${y} (#percent%)",
                    indexLabel: "{name} - #percent%",
                    dataPoints: [
                        { y: ${bloquer}, name: "Bloquée" },
                        { y: ${actif}, name: "Actif" ,exploded: true},
                        { y: 2, name: "Autres" }
                    ]
                }]
            });
            chart2.render();

            function explodePie (e) {if(typeof (e.dataSeries.dataPoints[e.dataPointIndex].exploded) === "undefined" || !e.dataSeries.dataPoints[e.dataPointIndex].exploded) {
                e.dataSeries.dataPoints[e.dataPointIndex].exploded = true;
            } else {
                e.dataSeries.dataPoints[e.dataPointIndex].exploded = false;
            }
                e.chart.render();
            }

        }
    </script>
</head>
<body>
<div id="chartContainer" style="height: 250px; max-width: 500px; margin: 0px auto; "></div>
<script src="static/js/canvasjs.min.js"></script>
</body>
</html>