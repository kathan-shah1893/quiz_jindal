<?php
// save_answers.php
header('Content-Type: application/json');

// DB credentials
$host = 'localhost';
$db = 'latest_quiz';
$user = 'root';
$pass = '';

try {
    // DB connection
    $pdo = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Get JSON data from frontend
    $data = json_decode(file_get_contents('php://input'), true);

    $username = $data['username'] ?? 'Guest';
    $quizId = $data['quizId'] ?? 1;
    $score = $data['score'] ?? 0;
    $total = $data['total'] ?? 0;
    $correct_percentage = $total > 0 ? ($score / $total) * 100 : 0;
    $answers = $data['answers'] ?? [];

    // 1️⃣ Insert into user_quiz_scores table
    $stmt = $pdo->prepare("
        INSERT INTO user_quiz_scores (username, quiz, score, total_score, correct_percentage)
        VALUES (?, ?, ?, ?, ?)
    ");
    $stmt->execute([$username, $quizId, $score, $total, $correct_percentage]);

    // Get the inserted quiz score ID
    $quizScoreId = $pdo->lastInsertId();

    // 2️⃣ Insert user answers
    $stmt = $pdo->prepare("
        INSERT INTO user_answers (user_quiz_score_id, question_id, selected_option, is_correct)
        VALUES (?, ?, ?, ?)
    ");

    foreach ($answers as $answer) {
        $questionId = $answer['question_id'];
        $selectedOption = $answer['selected_option'];
        $isCorrect = $answer['is_correct'] ? 1 : 0;

        $stmt->execute([$quizScoreId, $questionId, $selectedOption, $isCorrect]);
    }

    echo json_encode(['status' => 'success', 'message' => 'Results saved successfully!']);
} catch (PDOException $e) {
    echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
}
