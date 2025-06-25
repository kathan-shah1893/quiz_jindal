<?php
$host = 'localhost';
$db = 'latest_quiz';
$user = 'root';
$pass = '';
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
 
header('Content-Type: application/json');

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Step 1: Require token from URL
    if (!isset($_GET['token'])) {
        echo json_encode(['error' => 'Missing token parameter.']);
        exit;
    }

    $token = $_GET['token'];
    setcookie('quiz_token', $token, time() + (30 * 60), "/");

    // Step 2: Fetch token row
    $stmt = $pdo->prepare("SELECT user_id, email, view FROM user_data WHERE token = :token");
    $stmt->execute(['token' => $token]);
    $row = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$row) {
        echo json_encode(['error' => 'Invalid token.']);
        exit;
    }

    if ((int)$row['view'] === 1) {
        echo json_encode(['message' => 'Your quiz is already submitted.']);
        exit;
    }

    // Step 3: Mark token as viewed
    $stmt = $pdo->prepare("UPDATE user_data SET view = 1 WHERE token = :token");
    $stmt->execute(['token' => $token]);

    // Step 4: Assign quiz ID (can be dynamic if needed)
    //$quizId = 1; // You can map quiz ID from user or email if required
    //setcookie('quiz', $quizId, time() + (30 * 60), "/");

    // Step 5: Fetch quiz questions
    $stmt = $pdo->prepare("
        SELECT id, question, option1, option2, option3, option4, correct, justification
        FROM quiz_questions
        WHERE quiz = 1
    ");
    $stmt->execute();
    $questions = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Format data
    $output = [];
    foreach ($questions as $q) {
        $output[] = [
            'id' => $q['id'],
            'question' => $q['question'],
            'options' => [
                $q['option1'],
                $q['option2'],
                $q['option3'],
                $q['option4']
            ],
            'correct' => $q['correct'],
            'justification' => $q['justification']
        ];
    }

    echo json_encode($output);
} catch (PDOException $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
