const MAIN_URL = "http://localhost:3000"
const SESSIONS = "/sessions"
const cardContainer = document.querySelector('#cards-container')

function getCards() {
  fetch(`${MAIN_URL}${SESSIONS}/1`)
  .then(resp => resp.json())
  .then(json => renderCards(json.cards, json.id))
}

getCards()

function renderCards(cards, session_id) {
  cards.forEach(card => slapCardToDom(card, session_id))
}

function slapCardToDom(card, session_id) {
  cardContainer.innerHTML += `
  <h2>${card.question}</h2>
  ${randomizeAnswers(card)}
  <button type="submit" data-session-id=${session_id}>Submit</button>
  `
}

function randomizeAnswers(card) {
  const answer = card.answer
  const choices = card.choices.map(choice => choice.option)

  const answersArray = choices.map(choice => {
    const input = `
    <input type="radio" value="${choice}">${choice}<br>
    `
    return input
  })

  const answerInput = `
  <input type="radio" class="answer" value="${answer}">${answer}<br>
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
