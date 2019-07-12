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

c1 = Card.create(question: "What is the political party of the President now?", answer: "Republican", description: "The Republican Party, also referred to as the GOP (Grand Old Party), is one of the two major political parties in the United States; the other is its historic rival, the Democratic Party.", category: "Government", image_url: "images/trump.png")

c2 = Card.create(question: "We elect a President for how many years?", answer: "4", description: "Presidential elections take place every 4 years during the month of November.", category: "Government", image_url: "images/voting.png")

c3 = Card.create(question: "What did Martin Luther King Jr. do?", answer: "Fought for civil rights", description: "Martin Luther King Jr. (January 15, 1929 – April 4, 1968) was an American Baptist minister and activist who became the most visible spokesperson and leader in the civil rights movement from 1955 until his assassination in 1968.", category: "History", image_url: "images/mlk.png")

c4 = Card.create(question: "The House of Representatives has how many voting members?", answer: "435", description: "The United States House of Representatives is the lower house of the United States Congress, the Senate being the upper house. Together they compose the national legislature of the United States. The House is composed of representatives who sit in congressional districts that are allocated to each of the 50 states on a basis of population as measured by the U.S. Census, with each district entitled to one representative. Since its inception in 1789, all representatives have been directly elected. The total number of voting representatives is fixed by law at 435.", category: "Government", image_url: "images/federallaws.png")

c5 = Card.create(question: "What does the judicial branch do?", answer: "Explains laws", description: "The judicial branch is the system of federal courts and judges that interprets (explains) laws made by the legislative branch and enforced by the executive branch. The branch also reviews laws, resolves disputes and decides if the law goes against the Constitution.", category: "Government", image_url: "images/law.png")

c6 = Card.create(question: "Name one of the longest rivers in the United States", answer: "Missouri River", description: "The Missouri River is the longest river in North America. Mississippi River is the second longest.", category: "Geography", image_url: "images/river.png")

c7 = Card.create(question: "How many amendments does the Constitution have?", answer: "27", description: "A constitutional amendment is a modification of the constitution of a polity, organization or other type of entity. The first 10 amendments are called Bill of Rights.", category: "Government", image_url: "images/amendment.png")

c8 = Card.create(question: "Which of these is something Benjamin Franklin is known for?", answer: "He was the nation’s first postmaster general", description: "The postmaster general of the United States is the chief executive officer of the United States Postal Service. Benjamin Franklin was appointed by the Continental Congress as the first postmaster general in 1775, serving just over 15 months. Franklin had previously served as deputy postmaster for the British colonies of North America since 1753. Franklin was famous for his curiosity in electricity and experimenting with lightning, but did not discover electricity.", category: "History", image_url: "images/benfranklin.png")

c9 = Card.create(question: "Who was President during World War I?", answer: "Woodrow Wilson", description: "Woodrow Wilson (1856-1924), the 28th U.S. president, served in office from 1913 to 1921 and led America through World War I (1914-1918). Wilson sought to maintain American neutrality after the outbreak of World War One and was re-elected president in 1916 on the slogan 'He Kept Us Out of War'.", category: "History", image_url: "images/whosthepresident.png")

c10 = Card.create(question: "Which statement correctly describes the 'rule of law'?", answer: "No one is above the law", description: "Rule of law additionally states that everyone must follow the law, leaders must obey the law, and the government must obey the law.", category: "Government", image_url: "images/law2.png")

c11 = Card.create(question: "What ocean is on the West Coast of the United States?", answer: "Pacific Ocean", description: "The Pacific Ocean is the largest and deepest of Earth's oceanic divisions. It extends from the Arctic Ocean in the north to the Southern Ocean in the south and is bounded by Asia and Australia in the west and the Americas in the east.", category: "Geography", image_url: "images/ocean.png")

c12 = Card.create(question: "Which of the following is a U.S. territory?", answer: "Guam", description: "Other U.S. territories include Puerto Rico, U.S. Virgin Islands, American Samoa, and Northern Mariana Islands.", category: "Geography", image_url: "images/flag.png")

c13 = Card.create(question: "Which of the following states shares the border with Canada?", answer: "Ohio", description: "Other states include: Maine, New Hampshire, Vermont, New York, Pennsylvania, Michigan, Minnesota, North Dakota, Montana, Idaho, Washington and Alaska.", category: "Geography", image_url: "images/img-carte-canada-normal.gif")

c14 = Card.create(question: "Which of the following states shares the border with Mexico?", answer: "Arizona", description: "Other states include: Texas, California, and New Mexico.", category: "Geography", image_url: "images/mexico.png")

c15 = Card.create(question: "What is the capital of the United States?", answer: "Washington D.C.", description: "Washington, D.C., formally the District of Columbia and commonly referred to as Washington or D.C., is the capital of the United States.[4] Founded after the American Revolution as the seat of government of the newly independent country, Washington was named after George Washington, the first president of the United States and a Founding Father.", category: "Geography", image_url: "images/eagle.png")

c16 = Card.create(question: "Under the Constitution, which of these powers does not belong to the federal government?", answer: "Ratify amendments to the Constitution", description: "The federal government has many powers, but it cannot amend the Constitution on its own; it can only send proposed amendments to the states to be ratified. Two-thirds votes of both the House and Senate are needed to get the ball rolling; then three-quarters of the states must ratify an amendment to make it part of the Constitution.", category: "Government", image_url: "images/power.png")

c17 = Card.create(question: "We elect a U.S. Senator for how many years?", answer: "Six years", description: "Senators serve six-year terms, though they can add up. Robert C. Byrd, a West Virginia Democrat and the nation’s longest-serving senator, was in office for 51 years, five months and 26 days, from 1959 until his death in 2010.", category: "Government", image_url: "images/voting2.png")

c18 = Card.create(question: "Who is the Chief Justice of the United States now?", answer: "John G Roberts Jr.", description: "The chief justice of the United States is the chief judge of the Supreme Court of the United States, and as such the highest-ranking judge of the federal judiciary.", category: "Government", image_url: "images/chiefjustice.png")

c19 = Card.create(question: "The Federalist Papers supported the passage of the U.S. Constitution. Which of these men was not one of the authors?", answer: "John Adams", description: "The Federalist Papers is a collection of 85 articles and essays written by Alexander Hamilton, James Madison, and John Jay under the pseudonym 'Publius' to promote the ratification (when a bill becomes a law) of the United States Constitution.", category: "History", image_url: "images/eagle.png")

c20 = Card.create(question: "When was the Constitution written?", answer: "1787", description: "The Constitution of the United States is the supreme law of the United States of America. The Constitution, originally comprising seven articles, delineates the national frame of government.", category: "History", image_url: "images/flag2.png")

c21 = Card.create(question: "What is one important thing that Abraham Lincoln did?", answer: "Freed the slaves", description: "Abraham Lincoln was an American statesman, politician, and lawyer who served as the 16th president of the United States from 1861 until his assassination in April 1865. Lincoln led the nation through the American Civil War, its bloodiest war and its greatest moral, constitutional, and political crisis.", category: "History", image_url: "images/lincoln.png")

c22 = Card.create(question: "We elect a U.S. Representative for how many years?", answer: "2", description: "Elections for representatives are held in every even-numbered year, on Election Day the first Tuesday after the first Monday in November.", category: "Government", image_url: "images/voting2.png")

c23 = Card.create(question: "How many justices are on the Supreme Court?", answer: "9", description: "The Supreme Court of the United States is the highest ranking judicial body in the United States. Its membership, as set by the Judiciary Act of 1869, consists of the Chief Justice of the United States and eight associate justices.", category: "Government", image_url: "images/law2.png")

c24 = Card.create(question: "What did Susan B. Anthony do?", answer: "Fought for women's rights", description: "Susan B. Anthony was an American social reformer and women's rights activist who played a pivotal role in the women's suffrage movement. Born into a Quaker family committed to social equality, she collected anti-slavery petitions at the age of 17.", category: "History", image_url: "images/susanbanthony.png")

c25 = Card.create(question: "What is the supreme law of the land?", answer: "The Constitution", description: "The Constitution of the United States is the supreme law of the United States of America.", category: "Government", image_url: "images/supremelaw.png")

c26 = Card.create(question: "What does the President's Cabinet do?", answer: "Advises the President", description: "The Cabinet includes the Vice President and the heads of 15 executive departments.", category: "Government", image_url: "images/cabinet.png")

c27 = Card.create(question: "What is one right or freedom from the First Amendment?", answer: "Speech", description: "Other rights include: religion, assembly, press and to petition the government.", category: "Government", image_url: "images/freedom.png")

c28 = Card.create(question: "The idea of self-government is in the first three words of the Constitution. What are these words?", answer: "We the People", description: "The Preamble to the United States Constitution is a brief introductory statement of the Constitution's fundamental purposes and guiding principles.", category: "Government", image_url: "images/wethepeople.png")

c29 = Card.create(question: "What are two Cabinet level positions?", answer: "Secretary of State and the Attorney General", description: "Other positions include: Secretary of Agriculture, Secretary of Commerce, Secretary of Defense, Secretary of Education, Secretary of Energy, Secretary of Health & Human Services, Secretary of Homeland Security, Secretary of Housing and Urban Development, Secretary of the Interior, Secretary of Labor, Secretary of Transportation, Secretary of the Treasury, Secretary of Veteran Affairs and the Vice President.", category: "Government", image_url: "images/cabinetpositions.png")

c30 = Card.create(question: "Who makes federal laws?", answer: "Congress", description: "Legislation passed by Congress, an Executive Order of the President, or a decision of federal courts pursuant to the Constitution are federal law. Through the system of checks and balances, it is the Supreme Court makes final decisions regarding federal laws regarding specific cases brought before them.", category: "Government", image_url: "images/federallaws.png")



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
ch11 = Choice.create(option: "Red River")
ch12 = Choice.create(option: "Colorado River")
ch13 = Choice.create(option: "14")
ch14 = Choice.create(option: "21")
ch15 = Choice.create(option: "25")
ch16 = Choice.create(option: "He was the first person to sign the Constitution")
ch17 = Choice.create(option: "He discovered electricity")
ch18 = Choice.create(option: "He was the nation’s second president")
ch19 = Choice.create(option: "Warren Harding")
ch20 = Choice.create(option: "Calvin Coolidge")
ch21 = Choice.create(option: "Franklin D. Roosevelt")
ch22 = Choice.create(option: "The law is what the president says it is")
ch23 = Choice.create(option: "The people who enforce the laws do not have to follow them")
ch24 = Choice.create(option: "Judges can rewrite laws they disagree with")
ch25 = Choice.create(option: "Atlantic Ocean")
ch26 = Choice.create(option: "West Ocean")
ch27 = Choice.create(option: "Cuba")
ch28 = Choice.create(option: "Alaska")
ch29 = Choice.create(option: "Hawaii")
ch30 = Choice.create(option: "Illinois")
ch31 = Choice.create(option: "Wyoming")
ch32 = Choice.create(option: "Nebraska")
ch33 = Choice.create(option: "Florida")
ch34 = Choice.create(option: "Alabama")
ch35 = Choice.create(option: "Louisiana")
ch36 = Choice.create(option: "New York City")
ch37 = Choice.create(option: "Albany")
ch38 = Choice.create(option: "Print money")
ch39 = Choice.create(option: "Declare war")
ch40 = Choice.create(option: "Make treaties with foreign powers")
ch41 = Choice.create(option: "Four years")
ch42 = Choice.create(option: "Eight years")
ch43 = Choice.create(option: "Twelve years")
ch44 = Choice.create(option: "Ruth Bader Ginsburg")
ch45 = Choice.create(option: "William P. Barr")
ch46 = Choice.create(option: "Brett M. Kavanaugh")
ch47 = Choice.create(option: "James Madison")
ch48 = Choice.create(option: "Alexander Hamilton")
ch49 = Choice.create(option: "John Jay")
ch50 = Choice.create(option: "1492")
ch51 = Choice.create(option: "1776")
ch52 = Choice.create(option: "1865")
ch53 = Choice.create(option: "Signed the declaration of independence")
ch54 = Choice.create(option: "Moved the location of the White House")
ch56 = Choice.create(option: "8")
ch57 = Choice.create(option: "7")
ch58 = Choice.create(option: "10")
ch59 = Choice.create(option: "Created the first flag")
ch60 = Choice.create(option: "Penned the national anthem")
ch61 = Choice.create(option: "Bill of Rights")
ch62 = Choice.create(option: "The Declaration of Independence")
ch63 = Choice.create(option: "Writes bills")
ch64 = Choice.create(option: "Creates the law")
ch65 = Choice.create(option: "To vote")
ch66 = Choice.create(option: "To break the law")
ch67 = Choice.create(option: "Freedom is true")
ch68 = Choice.create(option: "The government believes")
ch69 = Choice.create(option: "Vice President and Secretary of Road Works")
ch70 = Choice.create(option: "Secretary of the Treasury and Secretary of International Affairs")
ch71 = Choice.create(option: "The President")
ch72 = Choice.create(option: "The Senate")




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

CardChoice.create(card_id: c6.id, choice_id: ch11.id)
CardChoice.create(card_id: c6.id, choice_id: ch12.id)

CardChoice.create(card_id: c7.id, choice_id: ch13.id)
CardChoice.create(card_id: c7.id, choice_id: ch14.id)
CardChoice.create(card_id: c7.id, choice_id: ch15.id)

CardChoice.create(card_id: c8.id, choice_id: ch16.id)
CardChoice.create(card_id: c8.id, choice_id: ch17.id)
CardChoice.create(card_id: c8.id, choice_id: ch18.id)

CardChoice.create(card_id: c9.id, choice_id: ch19.id)
CardChoice.create(card_id: c9.id, choice_id: ch20.id)
CardChoice.create(card_id: c9.id, choice_id: ch21.id)

CardChoice.create(card_id: c10.id, choice_id: ch22.id)
CardChoice.create(card_id: c10.id, choice_id: ch23.id)
CardChoice.create(card_id: c10.id, choice_id: ch24.id)

CardChoice.create(card_id: c11.id, choice_id: ch25.id)
CardChoice.create(card_id: c11.id, choice_id: ch26.id)

CardChoice.create(card_id: c12.id, choice_id: ch27.id)
CardChoice.create(card_id: c12.id, choice_id: ch28.id)
CardChoice.create(card_id: c12.id, choice_id: ch29.id)

CardChoice.create(card_id: c13.id, choice_id: ch30.id)
CardChoice.create(card_id: c13.id, choice_id: ch31.id)
CardChoice.create(card_id: c13.id, choice_id: ch32.id)

CardChoice.create(card_id: c14.id, choice_id: ch33.id)
CardChoice.create(card_id: c14.id, choice_id: ch34.id)
CardChoice.create(card_id: c14.id, choice_id: ch35.id)

CardChoice.create(card_id: c15.id, choice_id: ch36.id)
CardChoice.create(card_id: c15.id, choice_id: ch37.id)

CardChoice.create(card_id: c16.id, choice_id: ch38.id)
CardChoice.create(card_id: c16.id, choice_id: ch39.id)
CardChoice.create(card_id: c16.id, choice_id: ch40.id)

CardChoice.create(card_id: c17.id, choice_id: ch41.id)
CardChoice.create(card_id: c17.id, choice_id: ch42.id)
CardChoice.create(card_id: c17.id, choice_id: ch43.id)

CardChoice.create(card_id: c18.id, choice_id: ch44.id)
CardChoice.create(card_id: c18.id, choice_id: ch45.id)
CardChoice.create(card_id: c18.id, choice_id: ch46.id)

CardChoice.create(card_id: c19.id, choice_id: ch47.id)
CardChoice.create(card_id: c19.id, choice_id: ch48.id)
CardChoice.create(card_id: c19.id, choice_id: ch49.id)

CardChoice.create(card_id: c20.id, choice_id: ch50.id)
CardChoice.create(card_id: c20.id, choice_id: ch51.id)
CardChoice.create(card_id: c20.id, choice_id: ch52.id)

CardChoice.create(card_id: c21.id, choice_id: ch53.id)
CardChoice.create(card_id: c21.id, choice_id: ch54.id)

CardChoice.create(card_id: c22.id, choice_id: ch4.id)
CardChoice.create(card_id: c22.id, choice_id: ch56.id)

CardChoice.create(card_id: c23.id, choice_id: ch57.id)
CardChoice.create(card_id: c23.id, choice_id: ch58.id)

CardChoice.create(card_id: c24.id, choice_id: ch59.id)
CardChoice.create(card_id: c24.id, choice_id: ch60.id)

CardChoice.create(card_id: c25.id, choice_id: ch61.id)
CardChoice.create(card_id: c25.id, choice_id: ch62.id)

CardChoice.create(card_id: c26.id, choice_id: ch63.id)
CardChoice.create(card_id: c26.id, choice_id: ch64.id)

CardChoice.create(card_id: c27.id, choice_id: ch65.id)
CardChoice.create(card_id: c27.id, choice_id: ch66.id)

CardChoice.create(card_id: c28.id, choice_id: ch67.id)
CardChoice.create(card_id: c28.id, choice_id: ch68.id)

CardChoice.create(card_id: c29.id, choice_id: ch69.id)
CardChoice.create(card_id: c29.id, choice_id: ch70.id)

CardChoice.create(card_id: c30.id, choice_id: ch71.id)
CardChoice.create(card_id: c30.id, choice_id: ch72.id)



# SessionCard.create(session_id: s1.id, card_id: c1.id)
# SessionCard.create(session_id: s1.id, card_id: c2.id)
# SessionCard.create(session_id: s1.id, card_id: c3.id)
# SessionCard.create(session_id: s1.id, card_id: c4.id)
# SessionCard.create(session_id: s1.id, card_id: c5.id)
# SessionCard.create(session_id: s2.id, card_id: c1.id)
# SessionCard.create(session_id: s2.id, card_id: c2.id)
# SessionCard.create(session_id: s2.id, card_id: c3.id)
# SessionCard.create(session_id: s2.id, card_id: c4.id)
# SessionCard.create(session_id: s2.id, card_id: c5.id)
