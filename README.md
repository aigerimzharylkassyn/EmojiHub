# Emoji Hub

Emoji Hub — это мобильное iOS-приложение которое позволяет:
- просматривать разные каталоги эмодзи
- искать эмодзи по именам
- сортировать эмодзи по алфавитному порядку

# Инструкции по установке и запуску

1.
git clone https://github.com/ваш-никнейм/EmojiHub.git
cd EmojiHub

2.
в Xcode файл EmojiHub.xcodeproj откройте

В EmojiService.swift убедитесь что:
private let baseURL = URL(string: "https://emoji-hub-proxy-5b6f86f2f5e1.herokuapp.com/api/emojis")!

4. Run ▶ 

# Процесс проектирования и разработки
	1.	архитектура: MVVM с ViewModel на основе Combine для реактивных запросов
	2.	UI: SwiftUI (.rounded шрифты,элементы в виде карточек,фон)
	3.	сервер: Node.js + Express единый /api/emojis прокси https://github.com/aigerimzharylkassyn/emoji-hub-backend


# Уникальные подходы и методологии
	•	конвертация Unicode строк в Swift Character через String+Emoji.swift.
	•	красивый дизайн 😊

# Принятые компромиссы
Heroku бесплатный план ограничивает некоторые функций, но за то быстрый запуск и простые настройки

# Известные ошибки и ограничения
	•	при отсутствии сети показывается пустой список
	•	если в API появится новая категория нужно будет обновить список самой 

# Технический stack
Backend: Node.js, Heroku CLI, VS Code, terminal. 
Frontend: XCode (SwiftUI)

