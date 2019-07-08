const MAIN_URL = "http://localhost:3000"
const SESSIONS = "/sessions"
const USERS = "/users"
const cardContainer = document.querySelector('#card-container')
const statsContainer = document.querySelector('#stats-container')
const login = document.querySelector('#login')

function getCards(json) {
  fetch(`${MAIN_URL}${SESSIONS}/${json.id}`)
  .then(resp => resp.json())
  .then(json => {
    renderCards(json.cards, json.id)
    slapStatsOnTheDom(json)
  })
  .then(addEventListenersToPage())
}

function renderCards(cards, session_id) {
  cards.forEach(card => slapCardToDom(card, session_id))
}

function slapCardToDom(card, session_id) {
  cardContainer.innerHTML += `
  <h2>${card.question}</h2>
  <form action="/sessions/${session_id}" method="patch">
    ${randomizeAnswers(card)}
    <input type="submit" value="Submit" data-session-id=${session_id}>
  </form>
  `
}

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

function shuffleArray(array) {
  for (let i = array.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [array[i], array[j]] = [array[j], array[i]];
   }
   return array
}

function slapStatsOnTheDom(session) {
  statsContainer.innerHTML += `
    <h4 id="right">Right: ${session.right}</h4>
    <h4 id="wrong">Wrong: ${session.wrong}</h4>
  `
}

function addEventListenersToPage() {
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

      fetch(`${MAIN_URL}${SESSIONS}/${document.querySelector('input[type="submit"]').dataset.sessionId}`, configPatch)
      .then(resp => resp.json())
      .then(json => updateStats(json))
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

      fetch(`${MAIN_URL}${SESSIONS}/${document.querySelector('input[type="submit"]').dataset.sessionId}`, configPatch)
      .then(resp => resp.json())
      .then(json => updateStats(json))
    }
  })

  login.addEventListener('submit', e => {
    e.preventDefault()
    const user_input = login.querySelector('input[type="text"]').value

    fetch(`${MAIN_URL}${USERS}`)
    .then(resp => resp.json())
    .then(json => findOrCreateUser(json, user_input))
  })
}

function updateStats(session) {
    const right_stats = statsContainer.querySelector('#right')
    const wrong_stats = statsContainer.querySelector('#wrong')
    right_stats.innerText = `Right: ${session.right}`
    wrong_stats.innerText = `Wrong: ${session.wrong}`
}

function findOrCreateUser(users, user_input) {
  const result = users.find(user => {
    return user.name === user_input
  })
  if (result) {
    const user_id = result.id
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
  } else {

  }
}
