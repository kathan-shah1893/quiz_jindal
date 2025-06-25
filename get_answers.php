<?php
// get_answers.php

$host = 'localhost';
$db = 'latest_quiz';
$user = 'root';
$pass = '';

header('Content-Type: application/json');

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $stmt = $pdo->query("SELECT id, correct FROM quiz_questions");
    $answers = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $answerKey = [];
    foreach ($answers as $a) {
        // Assuming correct column has values 1–4 (convert to 0-indexed)
        $answerKey[$a['id']] = intval($a['correct']) - 1;
    }

    echo json_encode($answerKey);
} catch (PDOException $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
?>
