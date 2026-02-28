<?php
header('Content-Type: application/json');

$host = "localhost";
$username = "root";
$password = "root";
$dbname = "schema";

$conn = new mysqli($host, $username, $password, $dbname);
if ($conn->connect_error) die(json_encode(["error"=>$conn->connect_error]));

$sql = "
SELECT overall_risk_level AS risk_level, COUNT(*) AS total
FROM (
    SELECT p.product_name,
        CASE 
            WHEN SUM(CASE WHEN i.ingredient_id IN (9,10) THEN 1 ELSE 0 END) > 0 THEN 'High'
            WHEN AVG(i.risk_score) <= 1.5 THEN 'Low'
            WHEN AVG(i.risk_score) <= 2.3 THEN 'Medium'
            ELSE 'High'
        END AS overall_risk_level
    FROM products p
    JOIN product_ingredients pi ON p.product_id = pi.product_id
    JOIN ingredients i ON pi.ingredient_id = i.ingredient_id
    GROUP BY p.product_name
) AS risk_summary
GROUP BY overall_risk_level
";

$result = $conn->query($sql);

$distribution = [];
if($result){
    while($row = $result->fetch_assoc()){
        $distribution[] = [
            "risk_level" => $row['risk_level'],
            "total" => (int)$row['total']
        ];
    }
}

$conn->close();
echo json_encode($distribution);
?>