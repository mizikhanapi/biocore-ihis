<script>
    $('#tblNIW_ur').dataTable({
        "paging": true,
        "lengthChange": false,
        "pageLength": 4,
        "language": {
            "emptyTable": "No Record Available To Display"
        }
    });</script>
<canvas id="chart1" ></canvas>
<script>

    new Chart(document.getElementById("chart1").getContext("2d"), {
        type: 'line',
        data: {
            labels: ["January", "February", "mac", "april", "February", "February", "February", "February", "February", "February", "February"],
            datasets: [{
                    label: "Revenue",
                    data: [60, 80, 80, 80, 80, 80, 80, 80, 80, 30, 80],
                    borderColor: '#ff6384',
                    fill: true,
                }, {
                    label: "Pulse",
                    data: [10, 20, 80, 80, 80, 80, 80, 80, 80, 70, 80],
                    borderColor: '#cc65fe',
                    fill: true,
                    pointBackgroundColor: '#cc65fe',
                }]
        },
        options: {
            responsive: true,
            title: {
                display: true,
                text: 'Revenue'
            },
            tooltips: {
                mode: 'index',
                intersect: false,
            },
            hover: {
                mode: 'nearest',
                intersect: true
            },
            scales: {
                xAxes: [{
                        display: true,
                        scaleLabel: {
                            display: true,
                            labelString: 'Date Time'
                        }
                    }],
                yAxes: [{
                        scaleLabel: {
                            display: true,
                            labelString: "Speed in Miles per Hour",
                            fontColor: "green"
                        }
                    }]
            },
        }

    });



</script>