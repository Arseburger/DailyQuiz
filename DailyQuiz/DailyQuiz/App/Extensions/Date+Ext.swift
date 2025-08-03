import Foundation

extension Date {
    static func getDateAndTime() -> (date: String, time: String) {
        let calendar = Calendar.current
        
        let day = calendar.component(.day, from: .now)
        let monthNumber = calendar.component(.month, from: .now)
        
        let months = [
            "января", "февраля", "марта", "апреля", "мая", "июня",
            "июля", "августа", "сентября", "октября", "ноября", "декабря"
        ]
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "HH:mm"
        let month = months[monthNumber - 1]
        
        let dateString = "\(day) \(month)"
        let timeString = formatter.string(from: .now)
        
        return (date: dateString, time: timeString)
    }
}
