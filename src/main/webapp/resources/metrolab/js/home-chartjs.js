var Script = function () {

	


    var doughnutData = [
        {
            value: 30,
            color:"#F7464A",
            label: 'a'
        },
        {
            value : 50,
            color : "#46BFBD",
            label: 'e'
        },
        {
            value : 100,
            color : "#FDB45C",
            label: 'b'
        },
        {
            value : 40,
            color : "#949FB1",
            label: 'c'
        },
        {
            value : 120,
            color : "#4D5360",
            label: 'd'
        }

    ];
    var lineChartData = {
        labels : ["","","","","","",""],
        datasets : [
            {
                fillColor : "rgba(220,220,220,0.5)",
                strokeColor : "rgba(220,220,220,1)",
                pointColor : "rgba(220,220,220,1)",
                pointStrokeColor : "#fff",
                data : [65,59,90,81,56,55,40]
            },
            {
                fillColor : "rgba(151,187,205,0.5)",
                strokeColor : "rgba(151,187,205,1)",
                pointColor : "rgba(151,187,205,1)",
                pointStrokeColor : "#fff",
                data : [28,48,40,19,96,27,100]
            }
        ]

    };
    
   
    
    new Chart(document.getElementById("line").getContext("2d")).Line(lineChartData);
    new Chart(document.getElementById("doughnut").getContext("2d")).Doughnut(doughnutData);


}();