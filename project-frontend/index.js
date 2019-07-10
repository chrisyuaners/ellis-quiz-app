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
const cardsArray = []
let current_user_id = 0
let session_id = null
let currentCards = []
let card_index = 0


//initial load of all cards into cardsArray
function loadCards() {
  fetch(`${MAIN_URL}${CARDS}`)
  .then(resp => resp.json())
  .then(json => json.forEach(card => cardsArray.push(card)))
}

//initial call to add eventlisteners to page & loadcards
addEventListenersToPage()
loadCards()

//function to retrieve cards for the session
function getCards(json) {
  fetch(`${MAIN_URL}${SESSIONS}/${json.id}`)
  .then(resp => resp.json())
  .then(json => {
    session_id = json.id
    currentCards = json.cards
    renderCard(json.cards, json.id, card_index)
    slapStatsOnTheDom(json)
  })
}

function renderSelection() {
  cardContainer.innerHTML = `
  <button id="10-questions" class="selections">10 Questions</button>
  <button id="20-questions" class="selections">20 Questions</button>
  <button id="all-questions" class="selections">All Questions</button>
  `
}

//function to render cards on DOM
//load question function
function renderCard(cards, session_id, card_index) {
  const card = cards[card_index]
  cardContainer.innerHTML = `
  <div data-card-id="${card.id}" class="card">
    <div class = "flip-card-front">
      <h2>${card.question}</h2>
      <form action="/sessions/${session_id}" method="patch">
        ${randomizeAnswers(card)}
        <input type="submit" value="Submit" data-session-id=${session_id}>
      </form>
    </div>
    <div class = "flip-card-back">
      <h4>Answer: ${card.answer}</h4>
      <text>
        ${card.description}
      </text>
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
  `
}


//all eventlisteners for page
function addEventListenersToPage() {
  //right or wrong
  cardContainer.addEventListener('submit', e => {
    e.preventDefault()
    if (document.querySelector('input[name="selection"]:checked').className === 'answer') {
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
        updateStats(json)
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
          <h2>Congratulations!</h2>
          <br>
          <p>You got ${right_stats.innerText.split(" ")[1]} questions right out of ${total_stats.innerText}</p>
          <button id="restart">Restart</button>
        </div>
      `
    }
  })

  quizPage.addEventListener('click', e => {
    if (e.target.id === 'all-questions') {
      createSessionForUser(current_user_id)
    }
    if (e.target.id === 'restart') {
      card_index = 0
      session_id = null
      currentCards = []
      renderSelection()
    }
  })
}

function scrollDown(){
  window.scrollBy(0, 1000)
}

function flipCard(e){
  let el = e.target.parentElement.parentElement
  el.style["transform"] = "rotateY(180deg)";
}

//function to update stats during quiz
function updateStats(session) {
    const right_stats = statsContainer.querySelector('#right')
    const wrong_stats = statsContainer.querySelector('#wrong')
    const total_stats = statsContainer.querySelector('#total')
    right_stats.innerText = `Right: ${session.right}`
    wrong_stats.innerText = `Wrong: ${session.wrong}`
    total_stats.innerText = `${session.right + session.wrong}`

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
