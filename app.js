let questions = [];
let qIndex = 0;
let userAnswers = {};

// Navigation button events
document.getElementById("prevBtn").addEventListener("click", () => navigateTo(qIndex - 1));
document.getElementById("nextBtn").addEventListener("click", () => navigateTo(qIndex + 1));
function getTokenFromUrl() {
  const params = new URLSearchParams(window.location.search);
  return params.get("token");
}

// Fetch questions from PHP
// fetch('get_questions.php')
fetch(`get_questions.php?token=${getTokenFromUrl()}`)
  .then(res => res.json())
  .then(data => {
    console.log(data) 
    questions = data;
    renderQuiz();
  })
  .catch(err => console.error("Error fetching questions:", err));

// Navigation function
function navigateTo(index) {
  if (index >= 0 && index < questions.length) {
    qIndex = index;
    renderQuiz();
  }
}

// Render quiz
function renderQuiz() {


  const form = document.getElementById("quizForm");
  form.innerHTML = '';

  const question = questions[qIndex];
  const qDiv = document.createElement("div");
  qDiv.className = "question";
  qDiv.innerHTML = `<p style="color: black;">${qIndex + 1}. ${question.question}</p>`;

  const optionsDiv = document.createElement("div");
  optionsDiv.className = "answers";

  question.options.forEach((opt, i) => {
    const isChecked = userAnswers[qIndex] === i ? 'checked' : '';
    const isDisabled = userAnswers[qIndex] !== undefined ? 'disabled' : '';

    optionsDiv.innerHTML += `
      <label style="color: black; display: block; margin: 5px 0;">
        <input type="radio" name="q${qIndex}" value="${i}" ${isChecked} ${isDisabled} /> ${opt}
      </label>
    `;
  });

  qDiv.appendChild(optionsDiv);
  form.appendChild(qDiv);

  // Always clear the justification area when navigating
  const justificationDiv = document.getElementById("result");
  justificationDiv.innerHTML = '';

  // Show justification if already answered
  if (userAnswers[qIndex] !== undefined) {
    showJustification(qIndex, userAnswers[qIndex]);

    // Show a lock notice
    // const lockedNotice = document.createElement("p");
    // lockedNotice.style.color = "gray";
    // lockedNotice.style.fontStyle = "italic";
    // lockedNotice.textContent = "You have already answered this question.";
    // form.appendChild(lockedNotice);
  }

  // Add event listeners to radio buttons
  optionsDiv.querySelectorAll("input[type='radio']").forEach(radio => {
    radio.addEventListener("change", () => {
      // Prevent changes if already answered
      if (userAnswers[qIndex] !== undefined) return;

      // Save answer
      userAnswers[qIndex] = parseInt(radio.value);

      // Disable all options for this question
      optionsDiv.querySelectorAll("input[type='radio']").forEach(r => r.disabled = true);

      // Show justification and update navigation
      showJustification(qIndex, userAnswers[qIndex]);
      updateNavigation();

      // Add lock notice
      const lockedNotice = document.createElement("p");
      lockedNotice.style.color = "gray";
      lockedNotice.style.fontStyle = "italic";
      lockedNotice.textContent = "You have already answered this question.";
      form.appendChild(lockedNotice);
    });
  });

  // Show submit button on last question
  if (qIndex === questions.length - 1) {
    const submitBtn = document.createElement("button");
    submitBtn.className = "submit-button";
    submitBtn.textContent = "Submit Quiz";
    submitBtn.addEventListener("click", handleSubmit);
    form.appendChild(submitBtn);
  }

  updateNavigation();
}

// Show immediate justification
function showJustification(questionIndex, answerIndex) {
  const justificationDiv = document.getElementById("result");
  const question = questions[questionIndex];
  const selectedOption = question.options[answerIndex];
  const isCorrect = selectedOption.trim() === question.correct.trim();

  justificationDiv.innerHTML = `
    <p style="font-weight: bold; color: ${isCorrect ? 'green' : 'red'};">
      ${isCorrect ? '✔ Correct!' : '✖ Incorrect.'}
    </p>
    <p><b>Justification:</b> ${question.justification}</p>
  `;
}

// Handle quiz submission
function handleSubmit(e) {
  e.preventDefault();

  const resultBox = document.getElementById("result");

  // Check for unanswered questions
  let unanswered = [];
  questions.forEach((q, idx) => {
    if (userAnswers[idx] === undefined) {
      unanswered.push(idx + 1);
    }
  });

  if (unanswered.length > 0) {
    resultBox.innerHTML = `<p style="color: red;">❗ You missed question(s): ${unanswered.join(', ')}.</p>`;
    return;
  }

  let correctCount = 0;
  let summary = `<h3 style="color: black;">Quiz Results</h3>`;

  const answersToSave = questions.map((q, idx) => {
    const userAnswerIdx = userAnswers[idx];
    const userAnswer = q.options[userAnswerIdx];
    const isCorrect = userAnswer.trim() === q.correct.trim();
    if (isCorrect) correctCount++;

    summary += `
      <div style="margin: 10px 0; color: ${isCorrect ? 'green' : 'red'};">
        <b>Q${idx + 1}:</b> ${q.question}<br>
        <b>Your Answer:</b> ${userAnswer}<br>
        <b>Result:</b> ${isCorrect ? '✔ Correct' : '✖ Incorrect'}<br>
        <b>Justification:</b> ${q.justification || 'No justification provided.'}
      </div>
    `;

    return {
      question_id: q.id,
      selected_option: userAnswer,
      is_correct: isCorrect
    };
  });

  const percentage = ((correctCount / questions.length) * 100).toFixed(2);
  summary = `<p style="color: black;">Your score: ${correctCount}/${questions.length} (${percentage}%)</p>` + summary;

  let gifUrl = percentage >= 70 ? './7cr.mp4' : './less.mp4';

  summary = `
    ${summary}
    <div style="text-align:center; margin-top:20px;">
      <video id="resultVideo" src="${gifUrl}" autoplay playsinline style="max-width: 300px; border-radius: 8px;"></video>
    </div>
  `;

  // Store result in localStorage
  localStorage.setItem('quizSummary', summary);
  localStorage.setItem('resultGif', gifUrl);

  // Open result page in a new window (necessary for window.close to work)
  // const resultWindow = window.open("result.html", "_blank", "width=900,height=700");
  window.location.href = 'result.html';

  // Save results and answers in backend
  fetch('save_results_and_answers.php', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      score: correctCount,
      total: questions.length,
      answers: answersToSave
    })
  })
  .then(res => res.json())
  .then(data => {
    if (data.status === 'success') {
      console.log("Results and answers saved successfully!", data);
    } else {
      console.error("Error saving data:", data.message);
      resultBox.innerHTML += `<p style="color: red;">⚠️ Could not save results. Please try again later.</p>`;
    }
  })
  .catch(err => {
    console.error("Fetch error:", err);
    resultBox.innerHTML += `<p style="color: red;">⚠️ An error occurred while saving. Please try again later.</p>`;
  });

  window.scrollTo({ top: 0, behavior: 'smooth' });
}

// Update navigation buttons
function updateNavigation() {
  const nav = document.getElementById("navigation");
  nav.innerHTML = '';

  for (let i = 0; i < questions.length; i++) {
    const btn = document.createElement("button");
    btn.innerText = i + 1;

if (userAnswers[i] !== undefined) {
  btn.classList.add("answered");
  const userAnswer = questions[i].options[userAnswers[i]];
  const isCorrect = userAnswer.trim() === questions[i].correct.trim();
  btn.style.backgroundColor = isCorrect ? '#4caf50' : '#f44336'; // green or red
  btn.style.color = 'white';
}

    btn.onclick = () => navigateTo(i);
    nav.appendChild(btn);
  }

  document.getElementById("prevBtn").disabled = qIndex === 0;
  document.getElementById("nextBtn").disabled = qIndex === questions.length - 1;
}

// Toggle navigation display
function toggleNavigation() {
  document.getElementById("navigation").classList.toggle("show");
}
