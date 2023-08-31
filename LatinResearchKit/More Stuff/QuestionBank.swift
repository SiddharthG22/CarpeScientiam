//
//  QuestionBank.swift
//  LatinApp
//
//  Created by Siddharth Ganapathy on 4/25/21.
//

import Foundation
import UIKit

class QuestionBank {
  
    var introList_Gr = [Question]()
    var introList_H = [Question]()
    var introList_De = [Question]()
    var introList_DL = [Question]()
    var introList_M = [Question]()
    var introList_Ge = [Question]()
    
    var introVocab_N = [vocabQuestion]()
    var introVocab_V = [vocabQuestion]()
    var introVocab_ADJ = [vocabQuestion]()
    
    init() {
        
//        let secondAttributes = [NSAttributedString.Key.font: UIFont(name: "Cinzel", size: 12.5)]
        
        introList_Gr.append(Question(questionText: "What word best fits into the following list: pater, _____, fīlius, fīlia?", choiceA: "A. stella", choiceB: "B. equus", choiceC: "C. mater", choiceD: "D. ager", type: "Thematic Vocabulary", hint: "These words describe a family.", attributes: NSAttributedString(string: "_____"), answer: 3))
//        , attributes: secondAttributes as [NSAttributedString.Key: Any]
        introList_Gr.append(Question(questionText: "Mārcus multōs agrōs habet", choiceA: "A. many fields", choiceB: "B. near many fields", choiceC: "C. toward many fields", choiceD: "D. with many fields", type: "Noun Usage", hint: "This is the direct object of the verb.", attributes: NSAttributedString(string: "multōs agrōs"), answer: 1))
        introList_Gr.append(Question(questionText: "Mārcus cum familiā in casā habitat", choiceA: "A. his family", choiceB: "B. by his family", choiceC: "C. with his family", choiceD: "D. to his family", type: "Prepositions", hint: "", attributes: NSAttributedString(string: "cum familiā"), answer: 3))
        introList_Gr.append(Question(questionText: "Hodiē virī et fēminae Lūcium nōn laudant.", choiceA: "A. always", choiceB: "B. well", choiceC: "C. when", choiceD: "D. not", type: "Adverbs", hint: "", attributes: NSAttributedString(string: "nōn"), answer: 4))
        introList_Gr.append(Question(questionText: "Duo amīcī ambulāre in silvā amant.", choiceA: "A. used to love", choiceB: "B. were loving", choiceC: "C. love", choiceD: "D. loved", type: "Verb Tenses", hint: "", attributes: NSAttributedString(string: "amant"), answer: 3))
        introList_Gr.append(Question(questionText: "Nauta respondet, “Ita vērō, ego ad Aegyptum nāvigō", choiceA: "A. Perhaps", choiceB: "B. Yes", choiceC: "C. Soon", choiceD: "D. Not sure", type: "Oral Latin", hint: "", attributes: NSAttributedString(string: "Ita vērō"), answer: 2))
        introList_Gr.append(Question(questionText: "Iūlius Mārcō respondet, “Minimē, tēcum ambulō.", choiceA: "A. replied", choiceB: "B. will reply", choiceC: "C. replies", choiceD: "D. had replied", type: "Verb Tenses", hint: "", attributes: NSAttributedString(string: "respondet"), answer: 3))
        introList_Gr.append(Question(questionText: "Ubi Gnaeus et Aulus erant puerī, Claudia stolās pulchrās amābat.", choiceA: "A. When", choiceB: "B. Where", choiceC: "C. Since", choiceD: "D. Before", type: "Adverbs", hint: "", attributes: NSAttributedString(string: "Ubi"), answer: 1))
        
        introList_H.append(Question(questionText: "The eruption of what volcano buried the city of Pompeii?", choiceA: "A. Etna", choiceB: "B. Olympus", choiceC: "C. Ida", choiceD: "D. Vesuvius", type: "Thematic Vocabulary", hint: "", attributes: NSAttributedString(string: ""), answer: 4))
        introList_H.append(Question(questionText: "Which two brothers founded Rome?", choiceA: "A. Cassius and Brutus", choiceB: "B. Caesar and Pompey", choiceC: "C. Romulus and Remus", choiceD: "D. Tiberius and Gaius", type: "Thematic Vocabulary", hint: "", attributes: NSAttributedString(string: ""), answer: 3))
        introList_H.append(Question(questionText: "What animal is associated with the founding of Rome?", choiceA: "A. rabbit", choiceB: "B. wolf", choiceC: "C. goose", choiceD: "D. elephant", type: "Thematic Vocabulary", hint: "", attributes: NSAttributedString(string: ""), answer: 2))
        introList_H.append(Question(questionText: "Rome is on what river?", choiceA: "A. Seine", choiceB: "B. Tiber", choiceC: "C. Rubicon", choiceD: "D. Arno", type: "Thematic Vocabulary", hint: "", attributes: NSAttributedString(string: ""), answer: 2))
        introList_H.append(Question(questionText: "What were the commoners of Rome called?", choiceA: "A. Patricians", choiceB: "B. Freedmen", choiceC: "C. Equestrians", choiceD: "D. Plebians", type: "Thematic Vocabulary", hint: "", attributes: NSAttributedString(string: ""), answer: 4))
        introList_H.append(Question(questionText: "What structure, completed in 80 AD, could hold up to 50,000 people?", choiceA: "A. Foro Romano", choiceB: "B. Colosseum", choiceC: "C. Circus Maximus", choiceD: "D. Pantheum", type: "Thematic Vocabulary", hint: "", attributes: NSAttributedString(string: ""), answer: 2))
        introList_H.append(Question(questionText: "_____ magnam silvam habet.", choiceA: "A. Insulae", choiceB: "B. Insulam", choiceC: "C. Insulā", choiceD: "D. Insula", type: "Thematic Vocabulary", hint: "", attributes: NSAttributedString(string: "_____"), answer: 4))
        introList_H.append(Question(questionText: "Approximately when was Rome founded?", choiceA: "A. 27 BC", choiceB: "B. 753 BC", choiceC: "C. 1 AD", choiceD: "D. 73 AD", type: "Thematic Vocabulary", hint: "", attributes: NSAttributedString(string: ""), answer: 2))


        introList_De.append(Question(questionText: "The youth left home in search of pecuniary rewards.", choiceA: "A. education", choiceB: "B. money", choiceC: "C. adventure", choiceD: "D. freedom", type: "Thematic Vocabulary", hint: "", attributes: NSAttributedString(string: "pecuniary"), answer: 2))
        introList_De.append(Question(questionText: "The words were audible all over the building. Audible comes from the Latin verb meaning to: ", choiceA: "A. hear", choiceB: "B. read", choiceC: "C. see", choiceD: "D. write", type: "Thematic Vocabulary", hint: "", attributes: NSAttributedString(string: "audible"), answer: 1))
        introList_De.append(Question(questionText: "The worker’s per annum income was enough to meet their needs.", choiceA: "A. weekly", choiceB: "B. monthly", choiceC: "C. yearly", choiceD: "D. daily", type: "Thematic Vocabulary", hint: "", attributes: NSAttributedString(string: "per annum"), answer: 3))
        introList_De.append(Question(questionText: "The teacher said, “That’s a novel idea!” Novel means: ", choiceA: "A. new", choiceB: "B. bad", choiceC: "C. unique", choiceD: "D. wise", type: "Thematic Vocabulary", hint: "", attributes: NSAttributedString(string: ""), answer: 1))
        introList_De.append(Question(questionText: "Based on the Latin root, a person ambling through the woods is: ", choiceA: "A. clearing a path", choiceB: "B. hunting animals", choiceC: "C. calling to a friend", choiceD: "D. walking the paths", type: "Thematic Vocabulary", hint: "", attributes: NSAttributedString(string: "ambling"), answer: 4))
        introList_De.append(Question(questionText: "When a list ends with etc., it indicates that: ", choiceA: "A. the list is incorrect", choiceB: "B. the list has more items", choiceC: "C. the list is very important", choiceD: "D. the list is complete", type: "Thematic Vocabulary", hint: "", attributes: NSAttributedString(string: ""), answer: 2))
        introList_De.append(Question(questionText: "October, octet, and octave are all related to the Latin word for: ", choiceA: "A. eight", choiceB: "B. ocean", choiceC: "C. eye", choiceD: "D. music", type: "Thematic Vocabulary", hint: "", attributes: NSAttributedString(string: ""), answer: 1))
        introList_De.append(Question(questionText: "When sailors circumnavigate an island, they sail: ", choiceA: "A. through it", choiceB: "B. away from it", choiceC: "C. around it", choiceD: "D. across it", type: "Thematic Vocabulary", hint: "", attributes: NSAttributedString(string: "circumnavigate"), answer: 3))


        introList_DL.append(Question(questionText: "What was a common occurrence at the Colosseum?", choiceA: "A. Poetry performances", choiceB: "B. Gladiatorial fights", choiceC: "C. Cold baths", choiceD: "D. Senate meetings", type: "Thematic Vocabulary", hint: "", attributes: NSAttributedString(string: ""), answer: 2))
        introList_DL.append(Question(questionText: "A Roman woman would often wear a _____ over her stola", choiceA: "A. tunica", choiceB: "B. solea", choiceC: "C. toga", choiceD: "D. palla", type: "Thematic Vocabulary", hint: "", attributes: NSAttributedString(string: ""), answer: 3))
        introList_DL.append(Question(questionText: "What was the religious, economic, political, and social center of ancient Rome?", choiceA: "A. Via Appia", choiceB: "B. Colossēum", choiceC: "C. Circus Maximus", choiceD: "D. Forum Rōmānum", type: "Thematic Vocabulary", hint: "", attributes: NSAttributedString(string: ""), answer: 4))
        introList_DL.append(Question(questionText: "An ātrium, a cubiculum, and a tablīnum could all be found where?", choiceA: "A. in agrō", choiceB: "B. in silvā", choiceC: "C. in amphitheātrō", choiceD: "D. in vīllā", type: "Thematic Vocabulary", hint: "", attributes: NSAttributedString(string: ""), answer: 4))
        introList_DL.append(Question(questionText: "In an announcement of a person’s death, which phrase would you most likely see?", choiceA: "A. mare nostrum", choiceB: "B. in memoriam", choiceC: "C. festīnā lentē", choiceD: "D. ab urbe conditā", type: "Thematic Vocabulary", hint: "", attributes: NSAttributedString(string: ""), answer: 2))
        introList_DL.append(Question(questionText: "A Roman senator would most likely wear a ____ when out in public.", choiceA: "A. palla", choiceB: "B. stola", choiceC: "C. toga", choiceD: "D. bulla", type: "Thematic Vocabulary", hint: "", attributes: NSAttributedString(string: ""), answer: 2))
        introList_DL.append(Question(questionText: "What main room of a Roman house had an impluvium and compluvium as well as a shrine to the household gods?", choiceA: "A. trīclīnium", choiceB: "B. culīna", choiceC: "C. cubiculum", choiceD: "D. ātrium", type: "Thematic Vocabulary", hint: "", attributes: NSAttributedString(string: ""), answer: 4))
        introList_DL.append(Question(questionText: "Who in ancient Rome wore a toga praetexta?", choiceA: "A. servus", choiceB: "B. libertus", choiceC: "C. mater", choiceD: "D. dominus", type: "Thematic Vocabulary", hint: "", attributes: NSAttributedString(string: ""), answer: 2))


//        introList_M.append(Question(questionText: "What legendary Trojan led refugees from the fall of Troy across the Mediterranean Sea to establish a homeland in Italy?", choiceA: "A. Hector", choiceB: "B. Romulus", choiceC: "C. Achilles", choiceD: "D. Aeneas", answer: 2))
//        introList_M.append(Question(questionText: "Which Roman god rules the Underworld? ", choiceA: "A. Neptune", choiceB: "B. Apollo", choiceC: "C. Mars", choiceD: "D. Pluto", answer: 4))
//        introList_M.append(Question(questionText: "The peacock is the symbol of which goddess?", choiceA: "A. Minerva", choiceB: "B. Diana", choiceC: "C. Juno", choiceD: "D. Vesta", answer: 3))
//        introList_M.append(Question(questionText: "Which deity might bring help to a beauty pageant contestant?", choiceA: "A. Venus", choiceB: "B. Mars", choiceC: "C. Minerva", choiceD: "D. Pluto", answer: 1))
//        introList_M.append(Question(questionText: "Which goddess is the mother of Cupid and has a dove as a symbol? ", choiceA: "A. Venus", choiceB: "B. Maia", choiceC: "C. Demeter", choiceD: "D. Juno", answer: 1))
//        introList_M.append(Question(questionText: "What is the Roman name for the Greek god Hermes?", choiceA: "A. Bacchus", choiceB: "B. Mars", choiceC: "C. Mercury", choiceD: "D. Vulcan", answer: 3))
//        introList_M.append(Question(questionText: "Vulcan was a skilled: ", choiceA: "A. jeweller", choiceB: "B. blacksmith", choiceC: "C. weapon-maker", choiceD: "D. all of the above", answer: 4))
//        introList_M.append(Question(questionText: "The item associated with Pluto is: ", choiceA: "A. a trident", choiceB: "B. a cap of invisibility", choiceC: "C. an anvil", choiceD: "D. a lightning bolt", answer: 2))
//        
        
        introVocab_N.append(vocabQuestion(questionText: "Pater", genitive: "Patris", hint: "", answer: "Father"))
        introVocab_N.append(vocabQuestion(questionText: "Mater", genitive: "Matris", hint: "", answer: "Mother"))
        introVocab_N.append(vocabQuestion(questionText: "Filius", genitive: "Filiī", hint: "", answer: "Son"))
        introVocab_N.append(vocabQuestion(questionText: "Filia", genitive: "Fīliae", hint: "", answer: "Daughter"))
        introVocab_N.append(vocabQuestion(questionText: "Coquus", genitive: "Coquī", hint: "", answer: "Cook"))
        introVocab_N.append(vocabQuestion(questionText: "Servus", genitive: "Servī", hint: "", answer: "Slave"))
        introVocab_N.append(vocabQuestion(questionText: "Canis", genitive: "Canis", hint: "", answer: "Dog"))
        introVocab_N.append(vocabQuestion(questionText: "Feles", genitive: "Felis", hint: "", answer: "Cat"))

//        introVocab_V.append(vocabQuestion(questionText: <#T##String#>, type: <#T##String#>, hint: <#T##String#>, answer: <#T##String#>))
//        introVocab_V.append(vocabQuestion(questionText: <#T##String#>, type: <#T##String#>, hint: <#T##String#>, answer: <#T##String#>))
//        introVocab_V.append(vocabQuestion(questionText: <#T##String#>, type: <#T##String#>, hint: <#T##String#>, answer: <#T##String#>))
//        introVocab_V.append(vocabQuestion(questionText: <#T##String#>, type: <#T##String#>, hint: <#T##String#>, answer: <#T##String#>))
//        introVocab_V.append(vocabQuestion(questionText: <#T##String#>, type: <#T##String#>, hint: <#T##String#>, answer: <#T##String#>))
//        introVocab_V.append(vocabQuestion(questionText: <#T##String#>, type: <#T##String#>, hint: <#T##String#>, answer: <#T##String#>))
//        introVocab_V.append(vocabQuestion(questionText: <#T##String#>, type: <#T##String#>, hint: <#T##String#>, answer: <#T##String#>))
//        introVocab_V.append(vocabQuestion(questionText: <#T##String#>, type: <#T##String#>, hint: <#T##String#>, answer: <#T##String#>))
//
//        introVocab_ADJ.append(vocabQuestion(questionText: <#T##String#>, type: <#T##String#>, hint: <#T##String#>, answer: <#T##String#>))
//        introVocab_ADJ.append(vocabQuestion(questionText: <#T##String#>, type: <#T##String#>, hint: <#T##String#>, answer: <#T##String#>))
//        introVocab_ADJ.append(vocabQuestion(questionText: <#T##String#>, type: <#T##String#>, hint: <#T##String#>, answer: <#T##String#>))
//        introVocab_ADJ.append(vocabQuestion(questionText: <#T##String#>, type: <#T##String#>, hint: <#T##String#>, answer: <#T##String#>))
//        introVocab_ADJ.append(vocabQuestion(questionText: <#T##String#>, type: <#T##String#>, hint: <#T##String#>, answer: <#T##String#>))
//        introVocab_ADJ.append(vocabQuestion(questionText: <#T##String#>, type: <#T##String#>, hint: <#T##String#>, answer: <#T##String#>))
//        introVocab_ADJ.append(vocabQuestion(questionText: <#T##String#>, type: <#T##String#>, hint: <#T##String#>, answer: <#T##String#>))
//        introVocab_ADJ.append(vocabQuestion(questionText: <#T##String#>, type: <#T##String#>, hint: <#T##String#>, answer: <#T##String#>))


    }
}
