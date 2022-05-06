import UIKit

import SwiftUI

protocol Animal { var name: String {get}}
protocol Formatter {}

class Document {
    var name: String
    var content: String
    var url: URL?

    init(name: String, content: String, url: URL) {
        self.name = name
        self.content = content
        self.url = url
    }
    
    func send() -> Bool {
        guard let url = url else {
            return false
        }
        print(url)
        // Отправка документа на сервер
        return false
    }
}

class AnimalNamePrinter {
    var animal: Animal?
    
    func printAnimalName() {
        print(animal?.name ?? "")
    }
}


class PDF {
    let document: Document
    let service: Formatter

    init(document: Document, service: Formatter) {
        self.document = document
        self.service = service
    }

    func create() -> Data {
        // Тут мы можем создавать из документа Data
        return Data()
    }
}

class PDFParser {
    func parsingPDFtoPhone() {
        // Тут парсим PDF для показа на разные устройства
    }
    
    func parsingPDFtoComputer() {
        // Тут парсим PDF для показа на разные устройства
    }
    
    func parsingPDFtoPaper() {
        // Тут парсим PDF для показа на разные устройства
    }
}

protocol Sender {
    func sendPDF(_ pdf: PDF)
    func sendDocument(_ doc: Document)
}

protocol Saver {
    func savePDF(_ pdf: PDF)
    func saveDocument(_ doc: Document)
}

class FileManager : Sender {
    var service: Formatter?
    
    func sendPDF(_ pdf: PDF) {
        service = pdf.service
        // отправялем PDF
    }
    
    func sendDocument(_ doc: Document) {
        // отправялем Doc
    }
}

class FileSaver : Saver {
    func savePDF(_ pdf: PDF) {
        // сохраняем PDF
    }
    
    func saveDocument(_ doc: Document) {
        // сохраняем Doc
    }
}


protocol Machine {
    func convert(document: Document) -> Image?
    func convert(document: Document) -> PDF?
}

protocol Fax {
    func sendFax(document: Document)
}

class NewIphone : Machine {
    func convert(document: Document) -> PDF? {
        return nil
    }
    
    func convert(document: Document) -> Image? {
        return nil
    }
}

class FaxMachine : Fax {
    func sendFax(document: Document) {
        
    }
}
