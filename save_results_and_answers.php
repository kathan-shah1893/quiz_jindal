<?php
// save_results_and_answers.php

// Database credentials
$host = 'localhost';
$db = 'latest_quiz';
$user = 'root';
$pass = '';

header('Content-Type: application/json');

try {
    // Create PDO connection
    $pdo = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Decode JSON payload
    $data = json_decode(file_get_contents("php://input"), true);

    // Validate input
    if (!isset($data['score'], $data['total'], $data['answers'])) {
        echo json_encode(['status' => 'error', 'message' => 'Missing score, total, or answers']);
        exit;
    }

    // Use static username "kathan"
    $username = "kathan";
    $quizName = 1;
    $score = intval($data['score']);
    $total_score = intval($data['total']);
    $correct_percentage = ($score / $total_score) * 100;
    $taken_at = date('Y-m-d H:i:s');

    // Insert quiz result
    $stmt = $pdo->prepare("INSERT INTO user_quiz_scores (username, quiz, score, total_score, correct_percentage, taken_at)
                            VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->execute([$username, $quizName, $score, $total_score, $correct_percentage, $taken_at]);

    // Get the inserted quiz score ID
    $quizScoreId = $pdo->lastInsertId();

    // Insert user answers
    $answers = $data['answers']; // Array of answers
    $stmt = $pdo->prepare("INSERT INTO user_answers (user_quiz_score_id, question_id, selected_option, is_correct)
                            VALUES (?, ?, ?, ?)");

    foreach ($answers as $answer) {
        $questionId = intval($answer['question_id']);
        $selectedOption = $answer['selected_option'];
        $isCorrect = $answer['is_correct'] ? 1 : 0;

        $stmt->execute([$quizScoreId, $questionId, $selectedOption, $isCorrect]);
    }

    echo json_encode([
        'status' => 'success',
        'message' => 'Result and answers saved successfully!',
        'data' => [
            'username' => $username,
            'quiz' => $quizName,
            'score' => $score,
            'total_score' => $total_score,
            'correct_percentage' => round($correct_percentage, 2),
            'taken_at' => $taken_at
        ]
    ]);
} catch (PDOException $e) {
    echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
}
?>