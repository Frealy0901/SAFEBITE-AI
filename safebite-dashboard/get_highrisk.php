<?php
header('Content-Type: application/json');

$host = "localhost";
$username = "root";
$password = "root";
$dbname = "schema";

$conn = new mysqli($host, $username, $password, $dbname);
if ($conn->connect_error) die(json_encode(["error"=>$conn->connect_error]));

$sql = "
SELECT 
    p.product_name,
    AVG(i.risk_score) AS final_score,
    CASE 
        WHEN SUM(CASE WHEN i.ingredient_id IN (9,10) THEN 1 ELSE 0 END) > 0 THEN 'HIGH'
        WHEN AVG(i.risk_score) <= 1.5 THEN 'LOW'
        WHEN AVG(i.risk_score) <= 2.3 THEN 'MEDIUM'
        ELSE 'HIGH'
    END AS risk_level,
    CASE WHEN SUM(CASE WHEN i.ingredient_id IN (9,10) THEN 1 ELSE 0 END) > 0 THEN 1 ELSE 0 END AS override_triggered
FROM products p
JOIN product_ingredients pi ON p.product_id = pi.product_id
JOIN ingredients i ON pi.ingredient_id = i.ingredient_id
GROUP BY p.product_name
HAVING risk_level = 'HIGH'
";

$result = $conn->query($sql);

$highrisk = [];
if($result){
    while($row = $result->fetch_assoc()){
        $highrisk[] = [
            "product_name" => $row['product_name'],
            "final_score" => (float)$row['final_score'],
            "risk_level" => $row['risk_level'],
            "override_triggered" => (int)$row['override_triggered']
        ];
    }
}

$conn->close();
echo json_encode($highrisk);
?>