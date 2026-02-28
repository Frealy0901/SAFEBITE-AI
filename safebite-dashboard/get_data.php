<?php
header('Content-Type: application/json');

$host = "localhost";
$username = "root";
$password = "root";
$dbname = "schema";

$conn = new mysqli($host, $username, $password, $dbname);
if ($conn->connect_error) { die(json_encode(["error"=>$conn->connect_error])); }

$sql = "
SELECT p.id, p.name,
CASE 
    WHEN SUM(a.banned_additive) > 0 THEN 'HIGH'
    WHEN AVG(a.risk_score) <= 2.0 THEN 'LOW'
    WHEN AVG(a.risk_score) <= 3.5 THEN 'MEDIUM'
    ELSE 'HIGH'
END AS risk_level
FROM products p
JOIN additives a ON p.id = a.product_id
GROUP BY p.id
";

$result = $conn->query($sql);

$data = [];
if($result){
    while($row = $result->fetch_assoc()){
        $data[] = $row;
    }
}

$conn->close();
echo json_encode($data);
?>