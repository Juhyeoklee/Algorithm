import Foundation

struct Page {
    var url: String
    
    var wordScore: Int = 0
    var linkScore: Double = 0
    
    var matchingScore: Double {
        get {
            return Double(wordScore) + linkScore
        }
    }
    
    var links: [String]
    
    init(url: String, links: [String]) {
        
        var newStr = ""
        var idx = 0
        for c in url {
            if idx != url.count - 1 {
                newStr.append(c)
            }
            idx += 1
        }
        self.url = newStr
        self.links = links
    }
    
    mutating func setWordScore(word: String, body: String) {

        var newb = ""
        for c in body.lowercased() {
            if c >= "a" && c <= "z" {
                newb.append(c)
            }
            else {
                newb.append(" ")
            }
        }
       
        let bodyArr = newb.components(separatedBy: [" "]).filter {
            return $0.count != 0
        }
        .filter {
            return word.lowercased() == $0
        }
        self.wordScore = bodyArr.count
    }
    
    mutating func setLinkScore(pages: [Page]){
        
        for p in pages {
//            print(self.url)
//            print(p.url)
//            print(p.links)
//            print(p.wordScore)
            if p.links.contains(self.url) {
                var score: Double = Double(p.wordScore) / Double(p.links.count)
//                print(score)
                self.linkScore += score
            }
            
        }
    }
}

func solution(_ word:String, _ pages:[String]) -> Int {
    var scores: [Double] = []
    var pagesObj: [Page] = []
    
    for page in pages {
        var str: [String]
        var url: String
        var bodyStr: String = ""
        var links: [String] = []
        print(page.components(separatedBy: [" ", "\n", ">"]))
        str = page.components(separatedBy: ["=", " ", "\n", ">"])
        var idx = 0
        for s in str {
            
            if s == "content" {
                break
            }
            idx += 1
        }
//        print(str)
        url = str[idx + 1]
//        print(url)
        str = page.components(separatedBy: "\n")
        var isBody: Bool = false
        str.forEach {
            if $0 == "</body>" {
                isBody = false
            }
            if isBody {
                bodyStr.append($0)
            }
            if $0 == "<body>" {
                isBody = true
            }
        }

        var isLink = false
        print(bodyStr.components(separatedBy: [" ",">"]))
        
        bodyStr.components(separatedBy: ["="," ",">"]).forEach {
            
            if isLink {
                links.append($0)
                isLink = false
            }
            if $0 == "href" {
                isLink = true
            }
        }
//        print(url)
//        print(links)
        var p = Page(url: url, links: links)
        p.setWordScore(word: word, body: bodyStr)
        pagesObj.append(p)
    }
    
    var maxIdx = 0
    var maxScore = 0.0
    var idx = 0
    
    for i in 0..<pagesObj.count {
        pagesObj[i].setLinkScore(pages: pagesObj.filter {
            return $0.url != pagesObj[i].url
        })
        scores.append(pagesObj[i].matchingScore)
    }
    scores.forEach {
        if maxScore < $0 {
            maxIdx = idx
            maxScore = $0
        }
        idx += 1
    }
    return maxIdx
}

solution("blind", ["<html lang=\"ko\" xml:lang=\"ko\" xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n  <meta charset=\"utf-8\">\n  <meta property=\"og:url\" content=\"https://a.com\"/>\n</head>  \n<body>\nBlind Lorem Blind ipsum dolor Blind test sit amet, consectetur adipiscing elit. \n<a href=\"https://b.com\"> Link to b </a>\n</body>\n</html>", "<html lang=\"ko\" xml:lang=\"ko\" xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n  <meta charset=\"utf-8\">\n  <meta property=\"og:url\" content=\"https://b.com\"/>\n</head>  \n<body>\nSuspendisse potenti. Vivamus venenatis tellus non turpis bibendum, \n<a href=\"https://a.com\"> Link to a </a>\nblind sed congue urna varius. Suspendisse feugiat nisl ligula, quis malesuada felis hendrerit ut.\n<a href=\"https://c.com\"> Link to c </a>\n</body>\n</html>", "<html lang=\"ko\" xml:lang=\"ko\" xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n  <meta charset=\"utf-8\">\n  <meta property=\"og:url\" content=\"https://c.com\"/>\n</head>  \n<body>\nUt condimentum urna at felis sodales rutrum. Sed dapibus cursus diam, non interdum nulla tempor nec. Phasellus rutrum enim at orci consectetu blind\n<a href=\"https://a.com\"> Link to a </a>\n</body>\n</html>"])
