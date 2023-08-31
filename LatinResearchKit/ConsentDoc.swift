//
//  ConsentDoc.swift
//  LatinResearchKit
//
//  Created by Siddharth Ganapathy on 9/2/21.
//

import Foundation
import ResearchKit

public var ConsentDocument: ORKConsentDocument {
    
    let consentDocument = ORKConsentDocument()
    consentDocument.title = "Consent Time"
    
    let consentSectionTypes:[ORKConsentSectionType] = [
        .dataGathering
    ]
    
    let consentSections: [ORKConsentSection] = consentSectionTypes.map { contentSectionType in
        let consentSection = ORKConsentSection(type: contentSectionType)
        consentSection.title = "Quiz Time!"
        consentSection.summary = """
        We've assembled a diagnostic quiz \
        based on your indicated level. \
        Don't worry if you don't do well! \
        We'll use the results to create \
        personalized lesson plans for you. \
        There are 10 questions in total. \
        Bonam fortunam!
        """
        
        return consentSection
    }

    consentDocument.sections = consentSections
    return consentDocument
}


