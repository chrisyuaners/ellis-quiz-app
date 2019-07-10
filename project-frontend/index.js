//variable declarations
const MAIN_URL = "http://localhost:3000"
const SESSIONS = "/sessions"
const USERS = "/users"
const CARDS = "/cards"
const SESSIONCARDS = "/session_cards"
const cardContainer = document.querySelector('#card-container')
const statsContainer = document.querySelector('#stats-container')
const quizPage = document.querySelector('.quiz-page')
const login = document.querySelector('#login')
const selections = document.querySelector('#selections')
const mainPage = document.querySelector("#main-page")
const cardsArray = []
let current_user_id = 0
let session_id = null
let currentCards = []
let card_index = 0
let ten_questions = false
let twenty_questions = false
let government = false
let history = false
let geography = false
let toggleStats = true
let toggleTranslate = true
// let test = false

//initial load of all cards into cardsArray
function loadCards() {
  fetch(`${MAIN_URL}${CARDS}`)
  .then(resp => resp.json())
  .then(json => json.forEach(card => cardsArray.push(card)))
}

//initial call to add eventlisteners to page & loadcards
addEventListenersToPage()
loadCards()
lockScroll()

//initial call to temporarily lock scroll on login page
function lockScroll(){
  document.getElementsByTagName('body')[0].classList.add('noscroll')
}

function removeLockScroll(){
  document.getElementsByTagName('body')[0].classList.remove('noscroll')
}

//function to retrieve cards for the session
function getCards(json) {
  fetch(`${MAIN_URL}${SESSIONS}/${json.id}`)
  .then(resp => resp.json())
  .then(json => {
    session_id = json.id
    currentCards = shuffleArray(json.cards)
    if (ten_questions){
      currentCards = currentCards.slice(0,10)
    }
    if (twenty_questions){
      currentCards = currentCards.slice(0,20)
    }
    if (government){
      currentCards = currentCards.filter(card => card.category === 'Government')
    }
    if (history){
      currentCards = currentCards.filter(card => card.category === 'History')
    }
    if (geography){
      currentCards = currentCards.filter(card => card.category === 'Geography')
    }
    // if (test){
    //   currentCards = [currentCards.find(card => card.id === 1)]
    // }
    renderCard(currentCards, json.id, card_index)
    slapStatsOnTheDom(json)
  })
}

//function to render the quiz selection on quiz page
function renderSelection() {
  cardContainer.innerHTML = `

  <h4 id = "select-title-top">Select Number of Questions:</h4>
    <button id="10-questions" class="selections">10 Questions</button>
    <button id="20-questions" class="selections">20 Questions</button>
    <button id="all-questions" class="selections">All Questions</button>
  <h4>Select Questions by Category:</h4>
    <button id="government" class="selections">Government</button>
    <button id="history" class="selections">History</button>
    <button id="geography" class="selections">Geography</button>
  </div>
  <!-- <button id="test" class="selections">Test</button> -->
  `
}

//function to render cards on DOM
function renderCard(cards, session_id, card_index) {
  const card = cards[card_index]
  cardContainer.innerHTML = `
  <div data-card-id="${card.id}" class="card">
    <div class = "flip-card-front">
     <img class = "card-images" src= "${card.image_url}">
      <h2>${card.question}</h2>
      <form class = "answers-form" action="/sessions/${session_id}" method="patch">
        ${randomizeAnswers(card)}
        <input type="submit" value="Submit" data-session-id=${session_id}>
      </form>
      <p>${card_index + 1} out of ${cards.length}</p>
    </div>
    <div class = "flip-card-back">
      <h4>Answer: ${card.answer}</h4>
      <p>
        ${card.description}
      </p>
      <button id="next">Next</button>
    </div>
  </div>
  `
  if (card_index === currentCards.length -1){
    const next_button = cardContainer.querySelector("#next")
    next_button.innerText = "Finish"
  }
}

//load next question function
function loadNextQuestion(event){
  card_index ++
  renderCard(currentCards, session_id, card_index)
}

//function to randomize the order of answers
function randomizeAnswers(card) {
  const answer = card.answer
  const choices = card.choices.map(choice => choice.option)

  const answersArray = choices.map(choice => {
    const input = `
    <input type="radio" value="${choice}" name="selection">${choice}<br>
    `
    return input
  })

  const answerInput = `
  <input type="radio" class="answer" value="${answer}" name="selection">${answer}<br>
  `
  answersArray.push(answerInput)

  return shuffleArray(answersArray).join('')
}

//callback function to randomizeAnswers
function shuffleArray(array) {
  for (let i = array.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [array[i], array[j]] = [array[j], array[i]];
   }
   return array
}

//function to render stats on DOM
function slapStatsOnTheDom(session) {
  statsContainer.innerHTML = `
    <h4 id="right">Right: ${session.right}</h4>
    <h4 id="wrong">Wrong: ${session.wrong}</h4>
    <p id="total" hidden>${session.right+session.wrong}</p>
    <canvas id="my-chart" width="500" height="700"></canvas>
  `
  let card = document.querySelector('.flip-card-back')
}


//all eventlisteners for page
function addEventListenersToPage() {
  //right or wrong
  cardContainer.addEventListener('submit', e => {
    e.preventDefault()
    let answer = false
    if (document.querySelector('input[name="selection"]:checked').className === 'answer') {
      answer = true
      let current_right_stats = statsContainer.querySelector('#right').innerText.split(' ')[1]
      current_right_stats++
      const configPatch = {
        method: "PATCH",
        headers: {
          "Content-Type": 'application/json',
          Accept: 'application/json'
        },
        body: JSON.stringify({
          "right": current_right_stats
        })
      }

      fetch(`${MAIN_URL}${SESSIONS}/${cardContainer.querySelector('input[type="submit"]').dataset.sessionId}`, configPatch)
      .then(resp => resp.json())
      .then(json => {
        updateStats(json, answer)
        // showDescription(e.target.parentNode.parentNode)
        flipCard(e)
      })
    } else {
      let current_wrong_stats = statsContainer.querySelector('#wrong').innerText.split(' ')[1]
      current_wrong_stats++
      const configPatch = {
        method: "PATCH",
        headers: {
          "Content-Type": 'application/json',
          Accept: 'application/json'
        },
        body: JSON.stringify({
          "wrong": current_wrong_stats
        })
      }

      fetch(`${MAIN_URL}${SESSIONS}/${cardContainer.querySelector('input[type="submit"]').dataset.sessionId}`, configPatch)
      .then(resp => resp.json())
      .then(json => {
        updateStats(json)
        flipCard(e)
        // showDescription(e.target.parentNode.parentNode)
      })
    }
  })

  //login
  login.addEventListener('submit', e => {
    e.preventDefault()
    const user_input = login.querySelector('input[type="text"]').value

    fetch(`${MAIN_URL}${USERS}`)
    .then(resp => resp.json())
    .then(json => findOrCreateUser(json, user_input))
    .then(removeLockScroll())
    .then(scrollDown())
    .then(renderSelection())
  })

  //next button
  document.addEventListener('click', e => {
    if (e.target.id === "next" && e.target.innerText !== "Finish"){
      loadNextQuestion(e)
    }
  })

  //finish button
  document.addEventListener('click', e => {
    if (e.target.innerText === "Finish"){
      const right_stats = statsContainer.querySelector('#right')
      const wrong_stats = statsContainer.querySelector('#wrong')
      const total_stats = statsContainer.querySelector('#total')
      cardContainer.innerHTML =  `
        <div class="results">
          <h2>Good Job!</h2>
          <br>
          <p>You got ${right_stats.innerText.split(" ")[1]} questions right out of ${total_stats.innerText}</p>
          <button id="restart">Restart</button>
        </div>
      `
    }
  })

  //selection of quiz
  quizPage.addEventListener('click', e => {
   if (e.target.id === 'all-questions') {
     createSessionForUser(current_user_id)
   }
   if (e.target.id === '10-questions'){
     ten_questions = true
     createSessionForUser(current_user_id)
   }
   if (e.target.id === '20-questions'){
     twenty_questions = true
     createSessionForUser(current_user_id)
   }
   if (e.target.id === 'government'){
     government = true
     createSessionForUser(current_user_id)
   }
   if (e.target.id === 'history'){
     history = true
     createSessionForUser(current_user_id)
   }
   if (e.target.id === 'geography'){
     geography = true
     createSessionForUser(current_user_id)
   }
   // if (e.target.id === 'test'){
   //   test = true
   //   createSessionForUser(current_user_id)
   // }
   if (e.target.id === 'restart') {
     card_index = 0
     session_id = null
     currentCards = []
     ten_questions = false
     twenty_questions = false
     government = false
     history = false
     geography = false
     test = false
     renderSelection()
   }
 })

 //nav-bar functionality
 const nav_bar = document.querySelector('#navbar')

 nav_bar.addEventListener('click', e => {
   e.preventDefault()
   if (e.target.innerText === 'STATS') {
     if (toggleStats) {
       openStats()
       toggleStats = false
     } else {
       closeStats()
       toggleStats = true
     }
   } else if (e.target.innerText === 'TRANSLATE') {
     if (toggleTranslate) {

     }
   }
 })
}

function openStats() {
  document.querySelector('#stats-container').style.width = '320px'
  document.querySelector('#main-page').style.marginLeft = '320px'
}

function closeStats() {
  document.querySelector('#stats-container').style.width = '0'
  document.querySelector('#main-page').style.marginLeft = '0'
}

//function to scroll down page automatically upon login
function scrollDown(){
  const nav_bar = document.querySelector('#navbar')
  window.scrollBy(0, 1000)
  setTimeout(function(){ nav_bar.hidden = false }, 500)
}

//function to flip quiz card
function flipCard(e){
  let el = e.target.parentElement.parentElement
  el.style["transform"] = "rotateY(180deg)";
}

//function to update stats during quiz
function updateStats(session, answer) {
    const right_stats = statsContainer.querySelector('#right')
    const wrong_stats = statsContainer.querySelector('#wrong')
    const total_stats = statsContainer.querySelector('#total')
    const ctx = statsContainer.querySelector('#my-chart')
    right_stats.innerText = `Right: ${session.right}`
    wrong_stats.innerText = `Wrong: ${session.wrong}`
    total_stats.innerText = `${session.right + session.wrong}`

    let card = document.querySelector(".flip-card-back")
    if (answer){
      card.children[0].innerText += "  ✔"
      card.querySelector("h4").style.color = "#78ce78"
    } else {
      card.children[0].innerText += "  X"
      card.querySelector("h4").style.color = "#f15f5f"

    }
    const myBarChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['Right', 'Wrong'],
      datasets: [{
        label: 'Questions Answered',
        data: [session.right, session.wrong],
        backgroundColor: [
          'rgba(54, 162, 235, 0.2)',
          'rgba(255, 99, 132, 0.2)'
        ],
        borderColor: [
          'rgba(54, 162, 235, 1)',
          'rgba(255, 99, 132, 1)'
        ],
        borderWidth: 1
      }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                  min: 0,
                  max: 30,
                  stepSize: 1
                }
            }]
        }
    }
});
}

//function to find or create user upon login
function findOrCreateUser(users, user_input) {
  const result = users.find(user => {
    return user.name === user_input
  })
  if (result) {
    current_user_id = result.id
    // createSessionForUser(user_id)
  } else {
    const configPost = {
      method: "POST",
      headers: {
        "Content-Type": 'application/json',
        Accept: 'application/json'
      },
      body: JSON.stringify({
        "name": user_input
      })
    }
    fetch(`${MAIN_URL}${USERS}`, configPost)
    .then(resp => resp.json())
    .then(json => current_user_id = json.id)
  }
}

//function to create new session
function createSessionForUser(user_id) {
  const configPost = {
    method: "POST",
    headers: {
      "Content-Type": 'application/json',
      Accept: 'application/json'
    },
    body: JSON.stringify({
      "user_id": user_id,
      "right": 0,
      "wrong": 0
    })
  }
  fetch(`${MAIN_URL}${SESSIONS}`, configPost)
  .then(resp => resp.json())
  .then(json => getCards(json))
}
