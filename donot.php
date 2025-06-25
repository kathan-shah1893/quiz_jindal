<?php
$host = 'localhost';
$db = 'u894789821_jindal';
$user = 'root';
$pass = '';

$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch location-wise counts
$sql = "SELECT department, COUNT(*) AS count FROM `phishingusers` GROUP BY department;";
$result = $conn->query($sql);

$locations = [];
$counts = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $locations[] = $row['department'];
        $counts[] = $row['count'];
    }
}

$conn->close();
?>

<meta charset="UTF-8">
<title>Phishing Users by Location</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<h2>Phishing Users by Location</h2>

<div id="chartContainer">
    <canvas id="worldwide-sales"></canvas>
</div>

<script>
const ctx = document.getElementById('worldwide-sales').getContext('2d');
const donutChart = new Chart(ctx, {
    type: 'doughnut',
    data: {
        labels: <?php echo json_encode($locations); ?>,
        datasets: [{
            data: <?php echo json_encode($counts); ?>,
            backgroundColor: [
                '#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0',
                '#9966FF', '#FF9F40', '#00C49F', '#FF6F61'
            ],
            hoverOffset: 10
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: {
                position: 'right',
                labels: {
                    color: '#333',
                    boxWidth: 20,
                    padding: 15
                }
            },
            tooltip: {
                callbacks: {
                    label: function(context) {
                        return `${context.label}: ${context.formattedValue}`;
                    }
                }
            }
        }
    }
});
</script>