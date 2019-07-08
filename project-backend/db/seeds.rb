# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
Session.delete_all
Card.delete_all
Choice.delete_all
SessionCard.delete_all
CardChoice.delete_all

u1 = User.create(name: "Emi")
u2 = User.create(name: "Chris")

s1 = Session.create(user_id: u1.id, right: 0, wrong: 0)
s2 = Session.create(user_id: u2.id, right: 0, wrong: 0)

c1 = Card.create(question: "What is the political party of the President now?", answer: "Republican", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
c2 = Card.create(question: "We elect a President for how many years?", answer: "4", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
c3 = Card.create(question: "What did Martin Luther King Jr. do?", answer: "Fought for civil rights", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
c4 = Card.create(question: "The House of Representatives has how many voting members?", answer: "435", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
c5 = Card.create(question: "What does the judicial branch do?", answer: "Explains laws", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")

ch1 = Choice.create(option: "Democrat")
ch2 = Choice.create(option: "Independent")
ch3 = Choice.create(option: "2")
ch4 = Choice.create(option: "6")
ch5 = Choice.create(option: "Worked only toward African-American equality")
ch6 = Choice.create(option: "Fought against equality for all")
ch7 = Choice.create(option: "100")
ch8 = Choice.create(option: "50")
ch9 = Choice.create(option: "Makes laws")
ch10 = Choice.create(option: "Passes laws")

CardChoice.create(card_id: c1.id, choice_id: ch1.id)
CardChoice.create(card_id: c1.id, choice_id: ch2.id)
CardChoice.create(card_id: c2.id, choice_id: ch3.id)
CardChoice.create(card_id: c2.id, choice_id: ch4.id)
CardChoice.create(card_id: c3.id, choice_id: ch5.id)
CardChoice.create(card_id: c3.id, choice_id: ch6.id)
CardChoice.create(card_id: c4.id, choice_id: ch7.id)
CardChoice.create(card_id: c4.id, choice_id: ch8.id)
CardChoice.create(card_id: c5.id, choice_id: ch9.id)
CardChoice.create(card_id: c5.id, choice_id: ch10.id)

SessionCard.create(session_id: s1.id, card_id: c1.id)
SessionCard.create(session_id: s1.id, card_id: c2.id)
SessionCard.create(session_id: s1.id, card_id: c3.id)
SessionCard.create(session_id: s1.id, card_id: c4.id)
SessionCard.create(session_id: s1.id, card_id: c5.id)
SessionCard.create(session_id: s2.id, card_id: c1.id)
SessionCard.create(session_id: s2.id, card_id: c2.id)
SessionCard.create(session_id: s2.id, card_id: c3.id)
SessionCard.create(session_id: s2.id, card_id: c4.id)
SessionCard.create(session_id: s2.id, card_id: c5.id)
